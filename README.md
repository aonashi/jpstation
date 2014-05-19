# Jpstation [![Build Status](https://secure.travis-ci.org/aonashi/jpstation.png)](http://travis-ci.org/aonashi/jpstation)

A Rails plugin for treating Japanese railway data.

## Supported Versions

* Ruby 1.9.3, 2.0.0, 2.1.1
* Rails 4.0, 4.1

## Installation

You can add it to your Gemfile with:

    gem 'jpstation'

Run the bundle command to install it.

After you install Jpstation and add it to your Gemfile, you need to run the generator:

    $ rails generate jpstation:install

### Import data

Download the railway data from http://www.ekidata.jp and run the rake task:

    $ rake db:migrate
    $ rake jpstation:import FILE_DIR=/download/path

## Usage
### Customizing the railway models

Copy railway models to your Rails project if you want to customize.

    $ rails generate jpstation:models


## Contributing

1. Fork it ( https://github.com/aonashi/jpstation/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
