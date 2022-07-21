require_relative "../../structs/word"

module Components
  class Codes < FV::BasicObject
    attr_reader :rows, :returns
    ANALYZE_DONE = "ccad"

    def initialize
      super

      @row_regex    = /<.*>|^\s*$|^\s*=/  # e.g. <p> or blank or blank with '='
      @return_regex = /^\s*=|>=[^<>]*</   # e.g blank with '=' or >=notice<,

      @rows    = Array.new
      @returns = Array.new
    end

    def ready
      # puts @id
    end

    def analyze
      @parent.data.each_with_index do |row, i|
        is_row    = row.index(@row_regex)    == nil
        is_return = row.index(@return_regex) != nil
        
        create_word = -> (word_s, index_start, index_end) do
          word = Structs::Word.new(
            word_s,
            i, [index_start, index_end]
          )
        end

        if is_row
          index_start = row.index /\S/
          index_end = row.index /\n/

          @rows.append create_word.call(:row, index_start, index_end)
        elsif is_return
          index_start = row.index /\=/
          index_end = row.index /\n/

          row_filter = row.scan(@return_regex).last
          if row_filter.include?('<')
            index_start = row.index(row_filter) + 1
            index_end = index_start + row_filter.length - 1
          end

          @returns.append create_word.call(:return, index_start, index_end)
        end
      end

      emit_signal({ type: self.ANALYZE_DONE })
    end
  end
end