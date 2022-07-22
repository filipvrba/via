require_relative "../../structs/word"

module Components
  class Codes < FV::BasicObject
    attr_reader :rows, :returns

    def initialize
      super
      
      @@analyze_all_listener   = -> (signal) { @analyzer.analyze         }
      @@transform_all_listener = -> (signal) { @transformation.transform }

      @rows    = Array.new
      @returns = Array.new

      @analyzer       = Components::Analyzer.new
      @transformation = Components::Transformation.new
    end

    def ready
      connect(   Scenes::FileScript::ANALYZE_ALL,   @@analyze_all_listener  )
      connect(   Scenes::FileScript::TRAMSFORM_ALL, @@transform_all_listener)

      add(@analyzer,       'FS_C_A')
      add(@transformation, 'FS_C_T')
    end

    def free
      @rows           = nil
      @returns        = nil

      @analyzer       = nil
      @transformation = nil
      super
    end
  end
end
