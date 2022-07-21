require_relative "../components/file-script/index"

module Scenes
  class FileScript < FV::Scene
    attr_accessor :path, :name, :data

    def initialize
      super

      @codes = Components::Codes.new
    end

    def ready
      add(@codes, "FS_C")
      analyze_all()
    end

    def analyze_all
      @codes.analyze
    end
  end
end
