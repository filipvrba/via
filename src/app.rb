require File.absolute_path("../../lib/index", __FILE__)
require_relative "scenes/file_controller"
require_relative "constants"
require_relative "modules/app/index"

root = FV::Scene.new

sig_int do
  root.free
  exit
end

file_controller = Scenes::FileController.new
file_controller.save_to_dir = @options[:save][:dir]
file_controller.dev_mode    = @options[:is_dev]

root.connect(Scenes::FileController::START_CREATE_FILE, lambda do |signal|

    if file_controller.dev_mode >= 0 and file_controller.dev_mode < 2
      p_dev(signal[:data], signal[:name])
    end
  end
)

root.add(file_controller, "FC")

Data::get_files.each do |file|
  file_controller.add_file_script file

  if @options[:is_dev] == 2
    puts file
  end
end

root.free

# TODO: line breaking