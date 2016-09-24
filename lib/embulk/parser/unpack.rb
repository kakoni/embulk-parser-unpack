module Embulk
  module Parser

    class Unpack < ParserPlugin
      Plugin.register_parser("unpack", self)

      def self.transaction(config, &control)
        decoder_task = config.load_config(Java::LineDecoder::DecoderTask)

        # configuration code:
        task = {
          "decoder" => DataSource.from_java(decoder_task.dump),
          "format" => config.param("format", :string),
          "strip_whitespace" => config.param("strip_whitespace", :bool, default: true),
        }

        columns = []
        schema = config.param("columns", :array, default: [])
        schema.each do |column|
          name = column["name"]
          type = column["type"].to_sym
          columns << Column.new(nil, name, type)
        end

        yield(task, columns)
      end

      def init
        @format = task["format"]
        @decoder = task.param("decoder", :hash).load_task(Java::LineDecoder::DecoderTask)
        @strip_whitespace = task["strip_whitespace"]
      end


      def run(file_input)
        decoder = Java::LineDecoder.new(file_input.to_java, @decoder)

        while decoder.nextFile
          while line = decoder.poll
            process_line(line)
          end
        end

        page_builder.finish
      end

      private

      def process_line(line)
        values = line.unpack(@format)
        values.map(&:strip!) if @strip_whitespace
        page_builder.add(values)
      end

    end
  end
end
