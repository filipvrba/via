module Data
  def self.get_file
    file = OptionParser.last_arg()

    unless file
      exit()
    else
      if !File.exist?(file)
        puts "A #{file} doest existing, from this a \"#{Dir.pwd()}\" location."
        return exit()
      else
        return file
      end
    end
  end
end