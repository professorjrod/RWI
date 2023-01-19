def main
  input = 'test'
  expected = 'test'

  actual = SExpressionParser.new.parse(input)

  raise actual.inspect unless actual == expected

  input = '(test)'
  output = ['test']

  actual = SExpressionParser.new.parse(input)

  raise actual.inspect unless actual == output

  input = '(test case)'
  output = %w[test case]

  actual = SExpressionParser.new.parse(input)

  raise actual.inspect unless actual == output

  return if ARGV.empty?

  s_expression = SExpressionParser.new.parse(ARGF.read)
  pp s_expression
end

# Parse through using string using Regexp
class SExpressionParser
  def parse(string)
    self.string = string
    parse_expression
  end

  # Uses regexp to find opening parentheses, and adds to array. Once finds closing parentheses, it returns the array.
  def parse_expression
    if can_read?(/\(/)
      expressions = []
      read(/\(/)
      loop do
        break if can_read?(/\)/)

        expressions << parse_expression
      end
      read(/\)/)
      expressions
    else
      parse_atom
    end
  end

  private

  def can_read?(pattern)
    /\A#{pattern}/.match?(string)
  end

  # Uses regexp to match a pattern, sets the currently interpreted string to the remainder of the string that isn't matched, and returns the matched string.
  def read(pattern)
    match = /\A#{pattern}/.match(string) or raise "Expected #{pattern} but got #{string}"
    self.string = match.post_match
    match.to_s
  end
  attr_accessor :string
end

main
