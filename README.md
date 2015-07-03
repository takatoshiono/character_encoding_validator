# CharacterEncodingValidator [![Build Status](https://travis-ci.org/takatoshiono/character_encoding_validator.svg?branch=master)](https://travis-ci.org/takatoshiono/character_encoding_validator)

A character encoding validator for Rails. This is used to detect encoding errors.

This validator does the followings.

* Try encode the string to the destination encoding.
* If the exception raises, rescue it and add an error

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'character_encoding_validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install character_encoding_validator

## Usage

In your model.

```ruby
validates_with CharacterEncodingValidator, encoding: 'eucjp-ms'
```

`encoding` option is the destination encoding.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

