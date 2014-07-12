require 'grepity/option'
require 'grepity/target_text'
require 'grepity/target_file'
require 'grepity/line'

module Grepity
  def self.run!
    options = Option.parse
    text = TargetText.new(ARGV[0], options)
    TargetFile.new(ARGV[1]).match(text.value).each do |line|
      puts line.result(text.value, options)
    end
  end
end
