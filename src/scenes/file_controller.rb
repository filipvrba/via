require_relative "file_script"
require_relative "../components/file-controller/index"

module Scenes
  class FileController < FV::Scene
    attr_accessor :save_to_dir, :dev_mode
    START_CREATE_FILE = "scf"

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
      file_script = find_children(id)
      data = file_script.data.join
      relative_path = @in_out.get_relative_path(file_script)

      get_scene(true).emit_signal({ type: START_CREATE_FILE,
                                    data: file_script.data,
                                    name: File.basename(relative_path) })

      if @dev_mode <= 0
        path = @in_out.create_file(data, relative_path)
        puts "This a file '#{path}' has been created."
      end
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