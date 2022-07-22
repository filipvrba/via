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
      file_script = @parent.find_children(id)
      file = File.new(get_relative_path(file_script), "w+")
      file.write file_script.data.join
      file.close
    end
  end
end
