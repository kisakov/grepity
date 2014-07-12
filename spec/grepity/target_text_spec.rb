require_relative '../support/spec_helper'

def text(text, options = {})
  Grepity::TargetText.new(text, options)
end

describe Grepity::TargetText do
  let(:word) { 'rails' }

  it 'must be instance of Regexp' do
    text(word).value.must_be_instance_of Regexp
  end

  it 'must wright Regexp without options' do
    text(word).value.must_equal Regexp.new(word)
  end

  it 'must wright Regexp without option -i' do
    text(word, ignorecase: Regexp::IGNORECASE).value
      .must_equal Regexp.new(word, Regexp::IGNORECASE)
  end

  it 'must wright Regexp without option -w' do
    text(word, word: true).value.must_equal Regexp.new("\\b#{word}\\b")
  end
end