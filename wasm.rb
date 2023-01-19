def main
  input = 'test'
  expected = 'test'

  actual = SExpressionParser.new.parse(input)

  raise unless actual == expected

  return if ARGV.empty?

  s_expression = SExpressionParser.new.parse(ARGF.read)
  pp s_expression
end

# Parse through using string using Regexp and return a tree of SExpressions
class SExpressionParser
  def parse(string)
    self.string = string
  end

  private

  attr_accessor :string
end

main
