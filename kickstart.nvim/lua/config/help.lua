-- TODO: fix :h E222
local ns = vim.api.nvim_create_namespace("filetype.help")

local function merge_ranges(ranges)
  -- Sort & combine overlapping ranges (end exclusive)
  table.sort(ranges, function(a, b)
    return a[1] < b[1] or (a[1] == b[1] and a[2] < b[2])
  end)
  ranges = vim.iter(ranges):fold({}, function(acc, tbl)
    if #acc ~= 0 and acc[#acc][2] > tbl[1] then
      acc[#acc][2] = math.max(acc[#acc][2], tbl[2])
    else
      table.insert(acc, tbl)
    end
    return acc
  end)
  return ranges
end

local function ts_query_get_ranges(parser, root, query_string)
  local line_ranges = {}
  local query = vim.treesitter.query.parse(parser:lang(), query_string)
  for _, matches, _ in query:iter_matches(root, 0) do
    for _, match in ipairs(matches) do
      local start, _, _, stop, _, _ = unpack(vim.treesitter.get_range(match))
      if start ~= stop then
        table.insert(line_ranges, { start, stop })
      end
    end
  end
  return merge_ranges(line_ranges)
end

local function get_header_ranges(parser, root)
  local header_ranges = ts_query_get_ranges(parser, root, string.format("(line . [(h1) (h2) (h3)]) @v", type))

  -- We combine header_ranges & tag ranges only when they overlap
  local tag_ranges = ts_query_get_ranges(parser, root, '((line . [(h1) (h2) (h3)]) . (line . (tag)+ . "\\n"?)* @v)')
  vim.list_extend(tag_ranges, ts_query_get_ranges(parser, root, '((line . (tag)+) . (line . (tag)+ . "\\n"?) @v)'))
  for i, header_range in ipairs(header_ranges) do -- Yes O(n^2), I don't really care.
    for _, tag_range in ipairs(tag_ranges) do
      if
        header_range[1] <= tag_range[1] -- header starts first, or both are equal
        and header_range[2] + 1 >= tag_range[1]
      then -- header end is farther or equal than tag start
        header_ranges[i][2] = math.max(tag_range[2], header_range[2])
      elseif
        tag_range[1] < header_range[1] -- tag starts first
        and tag_range[2] + 1 >= header_range[1] -- tag end is farther or equal than header start
        and tag_range[2] < header_range[2]
      then -- tag end is less than header end
        header_ranges[i][1] = tag_range[1]
      end
    end
  end

  return header_ranges
end

local function get_stray_tag_ranges(parser, root)
  local ranges = ts_query_get_ranges(parser, root, '(block . (line (tag)+ . "\\n" .)+) @v') -- TODO: exclude this range with header_ranges
  return vim
    .iter(ranges)
    :filter(function(range)
      local start, _ = unpack(range)
      if start ~= 0 then
        return vim.api.nvim_buf_get_lines(0, start, start + 1, true)[1]:match("^%s*")
      end
      return false
    end)
    :totable()
end

local function longest_commmon_prefix(strings)
  if #strings == 0 then
    return ""
  end
  if #strings == 1 then
    return strings[1]
  end

  local shortest = vim.iter(strings):fold(strings[1], function(acc, shortest)
    return #shortest < #acc and shortest or acc
  end)
  for i = 1, #shortest do
    for j = 1, #strings do
      local line = strings[j]
      if shortest:sub(i, i) ~= line:sub(i, i) then
        return shortest:sub(1, i - 1)
      end
    end
  end
  return shortest
end

local function extmark_render_box(ranges, hl, border, cull_empty)
  cull_empty = cull_empty == nil and true or cull_empty

  local top_left, top, top_right, right, bottom_right, bottom, bottom_left, left = unpack(border)
  for _, range in ipairs(ranges) do
    local start, stop = unpack(range)
    local lines = vim.api.nvim_buf_get_lines(0, start, stop, true)
    local lines_are_empty = vim.iter(lines):fold(true, function(acc, line)
      return acc and #line == 0
    end)
    if not lines_are_empty then
      local indents = vim
        .iter(lines)
        :filter(function(line)
          return #line ~= 0
        end)
        :map(function(line)
          local ws_s, ws_e = line:find("^%s*")
          return line:sub(ws_s, ws_e)
        end)
        :totable()

      table.sort(indents, function(a, b)
        return a:gsub(" ", "s"):gsub("\t", " "):gsub("s", " ") > b:gsub(" ", "s"):gsub("\t", " "):gsub("s", " ")
      end)

      local indent = longest_commmon_prefix(indents)

      local max_line_width = vim.iter(lines):fold(0, function(acc, line)
        local width = vim.fn.strdisplaywidth(indent .. right .. " " .. line:sub(#indent + 1, -1))
        width = width - vim.fn.strdisplaywidth(indent)
        return math.max(acc, width)
      end)

      -- If dashes are already present above line, we reuse that line for top border
      local dashes_above = lines[1]:match("^-*$") or lines[1]:match("^=*$")
      local border_top = indent .. top_left .. top:rep(max_line_width) .. top_right
      if dashes_above then
        vim.api.nvim_buf_set_extmark(0, ns, start, 0, {
          virt_text = { { border_top, hl } },
          virt_text_pos = "overlay",
        })
      else
        vim.api.nvim_buf_set_extmark(0, ns, start, 0, {
          virt_lines = { { { border_top, hl } } },
          virt_lines_above = true,
        })
      end

      -- Render bottom border
      local border_bottom = indent .. bottom_left .. bottom:rep(max_line_width) .. bottom_right
      vim.api.nvim_buf_set_extmark(0, ns, stop, 0, {
        virt_lines = { { { border_bottom, hl } } },
        virt_lines_above = true,
      })

      -- Render left and right border
      for i = start, stop - 1 do
        if i ~= start or not dashes_above then
          if #indent <= #lines[i - start + 1] then
            vim.api.nvim_buf_set_extmark(0, ns, i, #indent, {
              virt_text = { { right .. " ", hl } },
              virt_text_pos = "inline",
            })
          else
            vim.api.nvim_buf_set_extmark(0, ns, i, 0, {
              virt_text = { { right .. " ", hl } },
              virt_text_win_col = vim.fn.strdisplaywidth(indent),
            })
          end
          vim.api.nvim_buf_set_extmark(0, ns, i, 0, {
            virt_text = { { left, hl } },
            virt_text_win_col = max_line_width + 1 + vim.fn.strdisplaywidth(indent),
          })
        end
      end
      -- For loop end
    end
  end
end

local function extmark_render_line_above(ranges, lines)
  for _, range in ipairs(ranges) do
    local start, _ = unpack(range)
    vim.api.nvim_buf_set_extmark(0, ns, start, 0, {
      virt_lines = lines,
      virt_lines_above = true,
    })
  end
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("filetype.help", {}),
  pattern = "help",
  callback = function()
    local parser = vim.treesitter.get_parser()
    local tree = parser:parse(true)
    local root = tree[1]:root()

    local border_double = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }
    local border_single = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
    local fn_desc = ts_query_get_ranges(
      parser,
      root,
      [[
        (block
          (line
            (column_heading
              (word) @w
              (#any-of? @w
                "Attributes:"
                "Parameters:"
                "Return:"
                "Properties:"
                "See"))) @v)
    ]]
    )
    local code_ranges = ts_query_get_ranges(parser, root, "(code) @v")
    local header_ranges = get_header_ranges(parser, root)
    local stray_tag_ranges = get_stray_tag_ranges(parser, root)
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
    extmark_render_box(code_ranges, "Comment", border_single)
    extmark_render_box(header_ranges, "@label.vimdoc", border_single)
    extmark_render_box(fn_desc, "Comment", border_single)
    extmark_render_line_above(stray_tag_ranges, {
      { { ("─"):rep(80), "@markup.heading.4.vimdoc" } },
    })
  end,
})
