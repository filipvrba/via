require_relative "helper"
require absolute_path("../../lib/index")
require_relative "scenes/file_controller"
require_relative "arguments"
require_relative "constants"

root = FV::Scene.new

file_controller = Scenes::FileController.new
file_controller.save_to_dir = @options[:save][:dir]
file_controller.dev_mode    = @options[:is_dev]

root.connect(Scenes::FileController::START_CREATE_FILE, lambda do |signal|

    if file_controller.dev_mode >= 0 and file_controller.dev_mode < 2
      p_dev(file_controller.get_data_files)
    end
  end
)

root.add(file_controller, "FC")
file_controller.add_file_script Data::get_file

root.free

# TODO: Add signal for exiting app