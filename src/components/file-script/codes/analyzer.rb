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
        create_word = -> (word_s, index_start, index_end) do
          word = Structs::Word.new(
            word_s,
            i, [index_start, index_end]
          )
        end

        is_row    = row.index(@row_regex)    == nil
        is_return = row.index(@return_regex) != nil

        if is_row
          row_state(   row, create_word)
        elsif is_return
          return_state(row, create_word)
        end

        return_comment(row, create_word)
      end

      parent.emit_signal({ type: Components::Analyzer::ANALYZE_DONE })
    end

    def row_state(row, create_word)
      index_start = row.index /\S/
      index_end   = row.index /\n/

      parent.rows.append    create_word.call(:row, index_start, index_end)
    end

    def return_comment(row, create_word)
      is_exist_start = row.index(/#{RETURN_COMMENT[:i_s][0]}|#{RETURN_COMMENT[:i_s][1]}/)
        
      if is_exist_start
        i_start = is_exist_start + RETURN_COMMENT[:i_s][0].length - 1
        i_end   = nil

        unless row.index(S_ERB[:r], i_start)
          i_end = row.index(/#{RETURN_COMMENT[:i_e][0]}|#{RETURN_COMMENT[:i_e][1]}/, i_start)
        end
          
        parent.rows.append    create_word.call(:return, i_start, i_end)
      end
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
