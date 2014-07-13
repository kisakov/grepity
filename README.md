# Grepity

TODO: Write a gem description

## Installation
Install it from RubyGems.org:

    $ gem install grepity

Or install it from GitHub.com:

    $ git clone git@github.com:kisakov/grepity.git
    $ rake install

## Usage

Run `grepity` for grep text from file

    Usage: grepity text file [OPTIONS]
    Example: grepity localhost /etc/hosts

    Common options:
        -i, --ignorecase                ignore case sensivity
        -w, --word                       match only full wordmatch
        -l, --line                       show line numbers
        -h, --help                       Help screen

## Tests

Use `rake test` to run tests

## Contributing

1. Fork it ( https://github.com/kisakov/grepity/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Ensure all tests passed (`rake test`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
