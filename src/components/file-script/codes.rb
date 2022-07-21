module Components
  class Codes < FV::BasicObject
    attr_reader :rows, :returns

    def initialize
      super

      row_regex    = //
      return_regex = //

      @rows    = Array.new
      @returns = Array.new
    end

    def ready
      # puts @id
    end

    def analyze
      @parent.data.each_with_index do |row, i|
        
      end
    end
  end
end