require_relative './support/spec_helper'
require 'fileutils'
require 'colorize'

def flag(set)
  ARGV.clear
  @exit = catch(:system_exit) { command_line(set) }
end

def command_line(options)
  options.each { |opt| ARGV << opt }
  def subject.exit(*args)
    throw(:system_exit, :exit)
  end
  subject
end

def capture_io
  require 'stringio'

  orig_stdout, orig_stderr         = $stdout, $stderr
  captured_stdout, captured_stderr = StringIO.new, StringIO.new
  $stdout, $stderr                 = captured_stdout, captured_stderr

  yield

  return captured_stdout.string, captured_stderr.string
ensure
  $stdout = orig_stdout
  $stderr = orig_stderr
end

def out(*args)
  capture_io { flag args }[0]
end

describe Grepity do
  subject { Grepity::run! }
  let(:file) { 'spec/fixtures/test_file.txt' }

  it 'prints empty string without options' do
    out('quantum', file).must_be_empty
  end

  it 'prints result with -i' do
    out('quantum', file, '-i').must_equal "Social #{colorized_word('Quantum')}"
  end

  it 'prints one line without options' do
    out('burg', file).must_equal "Saint Peters#{colorized_word('burg')}"
  end

  it 'prints two lines with -i' do
    out('burg', file, '-i').must_equal "Saint Peters#{colorized_word('burg')}#{colorized_word('Burg')}"
  end

  it 'prints one line with -i -w' do
    out('burg', file, '-i', '-w').must_equal colorized_word('Burg')
  end

  it 'prints one numbered line with -i -w -l' do
    out('burg', file, '-i', '-w', '-l').must_equal colorized_line_with_word(6, 'Burg')
  end
end
