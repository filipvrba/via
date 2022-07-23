module Components
  class Analyzer < FV::BasicObject
    ANALYZE_DONE = "ccad"

    def initialize
      super

      @row_regex    = /<.*>|^\s*$|^\s*=/  # e.g. <p> or blank or blank with '='
      @return_regex = /^\s*=|>=[^<>]*</   # e.g blank with '=' or >=notice<
    end

    def analyze
      get_scene.data.each_with_index do |row, i|
        is_row    = row.index(@row_regex)    == nil
        is_return = row.index(@return_regex) != nil

        create_word = -> (word_s, index_start, index_end) do
          word = Structs::Word.new(
            word_s,
            i, [index_start, index_end]
          )
        end

        if is_row
          row_state(   row, create_word)
        elsif is_return
          return_state(row, create_word)
        end
      end

      parent.emit_signal({ type: Components::Analyzer::ANALYZE_DONE })
    end

    def row_state(row, create_word)
      index_start = row.index /\S/
      index_end   = row.index /\n/

      parent.rows.append    create_word.call(:row, index_start, index_end)
    end

    def return_state(row, create_word)
      index_start = row.index /\=/
      index_end   = row.index(/\n/)
      row_scan    = row.scan(@return_regex).last

      if row_scan.include?('<')

        index_start = row.index(row_scan) + 1
        index_end   = index_start + row_scan.length - 2
      end

      parent.returns.append create_word.call(:return, index_start, index_end)
    end
  end
end
