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

    def create_file id
      file_script   = @parent.find_children(id)
      relative_path = get_relative_path(file_script)
      if @parent.save_to_dir
        relative_path = "#{@parent.save_to_dir}/#{relative_path}"
        FileUtils.mkdir_p( File.dirname(relative_path) )
      end

      file = File.new(relative_path, "w+")
      file.write file_script.data.join
      file.close

      return File.basename(relative_path)
    end
  end
end
