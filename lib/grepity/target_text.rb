module Grepity
  class TargetText
    attr_reader :value

    def initialize(text, options = {})
      @options = options
      @value = create_regexp(text)
    end

  private

    def create_regexp(text)
      text = "\\b#{text}\\b" if @options[:word]
      Regexp.new(text, @options[:ignorecase])
    end
  end
end

