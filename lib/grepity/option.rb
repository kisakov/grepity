require 'optparse'

module Grepity
  class Option
    def self.parse
      options = {}
      OptionParser.new do |opts|
        opts.banner = "Usage: #{$0} text file [OPTIONS]"

        opts.on('-i', '--ignorecase', 'ignore case sensivity') do
          options[:ignorecase] = Regexp::IGNORECASE
        end

        opts.on('-w', '--word', 'match only full word') do
          options[:word] = true
        end

        opts.on('-l', '--line', 'show line numbers') do
          options[:line] = true
        end

        opts.on_tail('-h', '--help', 'Help screen') do
          puts opts
          exit
        end
      end.parse!

      options
    end
  end
end