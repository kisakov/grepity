require_relative '../support/spec_helper'

describe Grepity::TargetFile do
  subject { Grepity::TargetFile.new('spec/fixtures/test_file.txt') }

  it 'must be instance of Array with Grepity::Line' do
    subj = subject.match('Quantum')
    subj.must_be_instance_of Array
    subj.first.must_be_instance_of Grepity::Line
  end
end