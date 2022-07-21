module Components
  class Codes < FV::BasicObject
    attr_reader :rows, :returns

    def initialize
      super

                      # e.g. <p> or blank or blank with '='
      @row_regex    = /<.*>|^\s*$|^\s*=/
                      # e.g blank with '=' or >=notice<
      @return_regex = /^\s*=|>=[^<>]*</

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
        
        
      end
    end
  end
end