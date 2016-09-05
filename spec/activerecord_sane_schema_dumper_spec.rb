require 'spec_helper'

describe ActiveRecord::SaneSchemaDumper do
  before do
    run_migration do
      create_table(:users, force: true) do |t|
        t.string :name, limit: 100
        t.text :profile
        t.datetime :created_at, null: false
        t.datetime :updated_at, null: false
      end
    end
  end

  let(:stream) { StringIO.new }
  let(:output) do
    ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, stream)
    stream.rewind
    stream.read
  end

  context 'with SaneSchemaDumper behavior' do
    before do
      ActiveRecord::SchemaDumper.prepend(ActiveRecord::SaneSchemaDumper::Extension)
    end

    let(:expected_table) do
      <<EOF
  create_table "users", force: :cascade do |t|
    t.string "name", limit: 100
    t.text "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
EOF
    end

    it { expect(output).to include(expected_table) }
  end

  context 'without SaneSchemaDumper behavior' do
    before do
      ActiveRecord::SaneSchemaDumper::Extension.send(:remove_method, :table)
    end

    let(:expected_table) do
      <<EOF
  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.text     "profile"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end
EOF
    end

    it { expect(output).to include(expected_table) }
  end
end
