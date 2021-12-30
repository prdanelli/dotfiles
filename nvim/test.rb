class Test
  attr_accessor :foo, :bar

  def initialize
    yield(self)
  end
end

t = Test.new do |conf|
  conf.foo = :baz
  conf.bar = :biz
end

puts t.inspect
