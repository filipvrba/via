require_relative "file_script"
require_relative "../components/file-controller/index"

module Scenes
  class FileController < FV::Scene
    def initialize
      super

      @in_out = Components::InOut.new
    end

    def ready
      add(@in_out, "IO")
    end

    def add_file_script path
      file = Scenes::FileScript.new
      file.path = path
      file.name = File.basename path
      file.data = @in_out.open_file_with_data(path)

      add(file, get_file_scripts.length)
    end

    def get_file_scripts
      @children.select{ |child| child.id.is_a?(Integer) }
    end
  end
end