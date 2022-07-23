require "fileutils"

module Components
  class InOut < FV::BasicObject

    def get_relative_path(file_script)
      file_script.path.sub(".#{FILE_TYPES[:via]}",
        ".#{FILE_TYPES[:erb]}")
    end

    def open_file_with_data path
      data = nil

      if File.exist? path
        File.open path do |f|
          data = f.readlines
        end
      end

      return data
    end

    def create_file data, relative_path
      if @parent.save_to_dir
        relative_path = File.join(@parent.save_to_dir, File.basename(relative_path))

        unless Dir.exist? @parent.save_to_dir
          FileUtils.mkdir_p File.dirname(relative_path)
        end
      end

      file = File.new(relative_path, "w+")
      file.write data
      file.close

      return relative_path
    end
  end
end
