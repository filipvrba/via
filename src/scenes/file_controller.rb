require_relative "file_script"
require_relative "../components/file-controller/index"

module Scenes
  class FileController < FV::Scene
    def initialize
      super

      @@ready_done_listener = lambda { |signal| script_ready_done(signal[:id]) }

      @in_out = Components::InOut.new
    end

    def ready
      connect(Scenes::FileScript::READY_DONE, @@ready_done_listener)

      add(@in_out, "IO")
    end

    def script_ready_done(id)
      @in_out.create_file id
    end

    def free
      @in_out = nil
      super
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