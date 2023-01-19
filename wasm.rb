def main
  input = 'test'
  expected = 'test'

  actual = SExpressionParser.new.parse(input)

  raise actual.inspect unless actual == expected

  input = '(test)'
  output = ['test']

  actual = SExpressionParser.new.parse(input)

  raise actual.inspect unless actual == output

  return if ARGV.empty?

  s_expression = SExpressionParser.new.parse(ARGF.read)
  pp s_expression
end

# Parse through using string using Regexp and return a tree of SExpressions
class SExpressionParser
  def parse(string)
    self.string = string
    parse_expression
  end

  def parse_expression
    if can_read?(/\(/)
      expressions = []
      read(/\(/)
      expressions << parse_expression
      read(/\)/)
      expressions
    else
      read(/[^)]+/)
    end
  end

  private

  def can_read?(pattern)
    /\A#{pattern}/.match?(string)
  end

  def read(pattern)
    match = /\A#{pattern}/.match(string) or raise "Expected #{pattern} but got #{string}"
    self.string = match.post_match
    match.to_s
  end
  attr_accessor :string
end

main
