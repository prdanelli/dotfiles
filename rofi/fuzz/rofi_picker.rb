require "fuzz"
require "debug"

module Fuzz
  class RofiPicker
    def initialize(args = {})
      @args = { "show" => "run", "matching" => "fuzzy", "dmenu" => "", "i" => "" }.merge(args)
    end

    def pick(keys)
      Fuzz::Executable.new("rofi").error_if_missing

      `echo "#{ keys.join("\n") }" | #{ command }`.strip
    end

    private

    def command
      "rofi #{string_args}"
    end

    def string_args
      @args.map { |k,v| "-#{k} #{v}" }.join(" ")
    end
  end
end

