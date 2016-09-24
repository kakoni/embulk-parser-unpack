require "prepare_embulk"
require "embulk/parser/unpack"
require "embulk/data_source"


module Embulk
  module Parser
    class QueryStringTest < Test::Unit::TestCase

      class TestProcessLine < self

        def test_foo
          mock(page_builder).add(["eka", "Toka", "Kolmas", "Neljas"])
          line = "ekaTokaKolmas Neljas"
          plugin.send(:process_line, line)
        end

        def plugin
         @plugin ||= Unpack.new(DataSource[task], schema, page_builder)
        end

        def page_builder
          @page_builder ||= Object.new
        end

        def task
          {
            "decoder" => {"Charset" => "UTF-8", "Newline" => "CRLF"},
            "format" => "a3a4a6@14a6",
            "columns" => columns,
          }
        end

        def columns
          [
            {"name" => "foo", "type" => :string},
            {"name" => "bar", "type" => :string},
            {"name" => "baz", "type" => :string},
            {"name" => "qux", "type" => :string},
          ]
        end

        def schema
          columns.map do |column|
            Column.new(nil, column["name"], column["type"].to_sym)
          end
        end

      end
    end
  end
end
