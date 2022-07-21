require_relative "../components/file-script/index"

module Scenes
  class FileScript < FV::Scene
    attr_accessor :path, :name, :data
    ANALYZE_ALL   = "aa"
    TRAMSFORM_ALL = "ta"

    def initialize
      super

      @codes = Components::Codes.new
    end

    def ready
      add(@codes, "FS_C")

      emit_signal({ type: ANALYZE_ALL })
      emit_signal({ type: TRAMSFORM_ALL })
    end
  end
end
