require_relative '../support/spec_helper'

def option(*options)
  ARGV.clear
  options.each { |option| ARGV << option }
  Grepity::Option.parse
end

describe Grepity::Option do
  it 'must be instance of Hash' do
    option.must_be_instance_of Hash
  end

  it 'ignorecase must be Regexp::IGNORECASE with -i' do
    option('-i').must_equal ignorecase: Regexp::IGNORECASE
  end

  it 'word must be true with -w' do
    option('-w').must_equal word: true
  end

  it 'line must be true with -l' do
    option('-l').must_equal line: true
  end
end