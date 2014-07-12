module Grepity
  class TargetFile
    def initialize(file_name)
      @lines = File.read(file_name).split("\n")
      @lines.map! { |line| Line.new(line, @lines.index(line)) }
    end

    def match(text)
      @lines.select { |line| line.contents.match(text) }
    end
  end
end