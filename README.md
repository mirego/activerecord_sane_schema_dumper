# ActiveRecord::SaneSchemaDumper

`ActiveRecord::SaneSchemaDumper` modifies the behavior of Rails’
`ActiveRecord::SchemaDumper` so that the generated `db/schema.rb` file doesn’t
contain any useless/harmful whitespace column alignment.

[![Gem Version](http://img.shields.io/gem/v/activerecord_sane_schema_dumper.svg)](https://rubygems.org/gems/activerecord_sane_schema_dumper)
[![Build Status](http://img.shields.io/travis/mirego/activerecord_sane_schema_dumper.svg)](https://travis-ci.org/mirego/activerecord_sane_schema_dumper)

## ⚠️ WARNING · OBSOLETE ⚠️

This gem is no longer required since Rails 6 ([reference commit](https://github.com/rails/rails/commit/df84e9867219e9311aef6f4efd5dd9ec675bee5c)). Rails no longer adds superfulous whitespace when dumping the schema 🙌.

## Installation

Add this line to your application’s Gemfile in your `development` group:

```ruby
group :development do
  gem 'activerecord_sane_schema_dumper'
end
```

## Usage

The gem modifies the behavior of Rails’ `rake db:schema:dump` task. This task
is part of Rails migrations process to ensure that `db/schema.rb` stays in-sync
with your local database.

It removes all useless whitespace that Rails adds so adding/modifying/removing
columns from your tables only touches relevant lines (because other table lines
do not try to stay aligned).

### Before

```ruby
# db/schema.rb
create_table "event_data", force: true do |t|
  t.string   "event_external_id"
  t.json     "data",              default: {}
  t.datetime "created_at",                     null: false
  t.datetime "updated_at",                     null: false
end
```

But what happens if I remove the `data` column and regenerate `db/schema.rb`? Here’s the resulting diff:

```ruby
   create_table "event_data", force: true do |t|
     t.string   "event_external_id"
-    t.datetime "created_at",                     null: false
-    t.datetime "updated_at",                     null: false
-    t.json     "data",              default: {}
+    t.datetime "created_at",        null: false
+    t.datetime "updated_at",        null: false
   end
```

We’ve removed the `data` column but `created_at` and `updated_at` lines are affected too. This is not good.

### After

```ruby
# db/schema.rb
create_table "event_data", force: true do |t|
  t.string "event_external_id"
  t.json "data", default: {}
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end
```

If I remove the `data` column and regenerate the `db/schema.rb` file, only the relevant line will be touched:

```ruby
   create_table "event_data", force: true do |t|
     t.string "event_external_id"
-    t.json "data", default: {}
     t.datetime "created_at", null: false
     t.datetime "updated_at", null: false
   end
```

One removed column, one affected line in the table definition. Much better.

## License

`ActiveRecord::SaneSchemaDumper` is © 2014-2016 [Mirego](http://www.mirego.com) and may be freely distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).  See the [`LICENSE.md`](https://github.com/mirego/activerecord_sane_schema_dumper/blob/master/LICENSE.md) file.

## About Mirego

[Mirego](http://mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We're a team of [talented people](http://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://mirego.org).

We also [love open-source software](http://open.mirego.com) and we try to give back to the community as much as we can.
