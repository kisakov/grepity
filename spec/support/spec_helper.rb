require 'minitest/autorun'
require 'minitest/pride'
require 'grepity'

def colorized_word(word)
  word.yellow + "\n"
end

def colorized_line_with_word(line, word)
  "#{line.to_s.green}: #{colorized_word(word)}"
end

