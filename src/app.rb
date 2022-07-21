require_relative "helper"
require absolute_path("../../lib/index")
require_relative "scenes/file_controller"
require_relative "arguments"

root = FV::Scene.new
file_controller = Scenes::FileController.new

root.add(file_controller, "FC")
file_controller.add_file_script Data::get_file