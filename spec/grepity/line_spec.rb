require_relative '../support/spec_helper'
require 'colorize'

describe Grepity::Line do
  subject { Grepity::Line.new('Social quantum', 12) }

  it 'prints result string without options' do
    subject.result('quantum')
           .must_equal "Social #{colorized_word('quantum').rstrip}"
  end

  it 'prints result string with numbers' do
    subject.result('Social quantum', line: true)
           .must_equal "#{colorized_line_with_word(13, 'Social quantum').rstrip}"
  end
end