module Components
  class Codes < FV::BasicObject
    attr_reader :rows, :returns

    def initialize
      super

      @row_regex    = /<.*>|^\s*$|^\s*=/  # e.g. <p> or blank or blank with '='
      @return_regex = /^\s*=|>=[^<>]*</   # e.g blank with '=' or >=notice<

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
        
        if is_row
          
        elsif is_return
          
        end
      end
    end
  end
end