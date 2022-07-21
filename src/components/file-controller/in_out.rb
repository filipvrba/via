module Components
  class InOut < FV::BasicObject

    def open_file_with_data path
      data = nil

      if File.exist? path
        File.open path do |f|
          data = f.read
        end
      end

      return data
    end
  end
end
