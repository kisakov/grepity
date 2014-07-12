require 'colorize'

module Grepity
  class Line
    attr_reader :contents, :number

    def initialize(contents, number)
      @contents, @number = contents, number + 1
    end

    def result(text, options = {})
      return colorized_line_with_text(number, text) if options[:line]
      colorized_text(text)
    end

  private

    def colorized_text(text)
      matched_text = @contents.match(text)[0].yellow
      @contents.gsub(text, matched_text)
    end

    def colorized_line_with_text(number, text)
      "#{number.to_s.green}: #{colorized_text(text)}"
    end
  end
end