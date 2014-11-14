# ActiveRecord::SaneSchemaDumper

`ActiveRecord::SaneSchemaDumper` modifies the behavior of Rails’
`ActiveRecord::SchemaDumper` so that the generated `db/schema.rb` file doesn’t
contain any useless/harmful whitespace column alignment.

[![Gem Version](http://img.shields.io/gem/v/activerecord_sane_schema_dumper.svg)](https://rubygems.org/gems/activerecord_sane_schema_dumper)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord_sane_schema_dumper'
```

## Usage

The gem modifies the behavior of Rails’ `rake db:schema:dump` task.

## License

`ActiveRecord::SaneSchemaDumper` is © 2014 [Mirego](http://www.mirego.com) and may be freely distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).  See the [`LICENSE.md`](https://github.com/mirego/activerecord_json_validator/blob/master/LICENSE.md) file.

## About Mirego

[Mirego](http://mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We're a team of [talented people](http://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://mirego.org).

We also [love open-source software](http://open.mirego.com) and we try to give back to the community as much as we can.
