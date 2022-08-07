require_relative "../components/file-script/index"

module Scenes
  class FileScript < FV::Scene
    attr_accessor :path, :name, :data
    ANALYZE_ALL   = "aa"
    TRAMSFORM_ALL = "ta"
    READY_DONE    = "rd"

    def initialize
      super

      @codes = Components::Codes.new
    end

    def ready
      fix_last_row()
      
      add(@codes, "FS_C")

      @codes.emit_signal({ type: ANALYZE_ALL })
      @codes.emit_signal({ type: TRAMSFORM_ALL })

      get_scene.emit_signal({ type: READY_DONE, id: id })
    end

    def fix_last_row
      unless @data.last.include?("\n")
        @data.last << "\n"
      end
    end

    def free
      @codes = nil
      super
    end
  end
end
