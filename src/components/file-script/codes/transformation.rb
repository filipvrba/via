module Components
  class Transformation < FV::BasicObject
    def transform
      codes = parent.rows + parent.returns
      codes.each do |row|
        get_scene.data[row.index_row] = manipulation(row)
      end
    end

    def manipulation(row)
      data_row     = get_scene.data[row.index_row]
      data_row_erb = -> (index, sym)  do
        data_row = data_row.chars.insert(index,
          SPECIAL_SYMBOLS_ERB[row.type][sym]).join
      end

      data_row_erb.call(row.index_dim[0], :l)
      data_row_erb.call(row.index_dim[1] +
        SPECIAL_SYMBOLS_ERB[:row][:l].length, :r)

      return data_row
    end
  end
end