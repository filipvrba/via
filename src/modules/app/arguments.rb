module Data
  def self.get_files
    file = OptionParser.last_arg()

    unless file
      return find_all_files(Dir.pwd)
    else
      if File.directory? file
        return find_all_files(file)
      else
        if !File.exist?(file)
          puts "A #{file} doest existing."
          return exit()
        else
          return [file]
        end
      end
    end
  end

  def self.find_all_files(dir_path = "")
    Dir.glob("#{dir_path}/**/*.#{FILE_TYPES[:via]}")
  end
end

@options = {
  is_dev: -1,
  save: {
    dir: nil
  },
  is_install: false,
}

OptionParser.parse do |parser|
  parser.banner( "Usage: via [options] [file|dir]\n\nOptions:" )
  parser.on( "-h", "--help", "Show help" ) do
      puts parser
      exit
  end
  parser.on( "-v", "--version", "Show version" ) do
    puts VERSIONS.last
    exit
  end
  parser.on( "-i", "--install", "Installing the via to an rails project." ) do
    @options[:is_install] = true
  end
  parser.on( "-d ID", "--dev ID", "Enable an developing state." ) do |id|
    is_int = id.to_i.to_s == id
    if is_int
      @options[:is_dev] = id.to_i
    else
      @options[:is_dev] = 0
    end
  end
  parser.on( "-s DIR", "--save DIR", "Save a convert file to directory." ) do |dir|
    @options[:save][:dir] = File.realdirpath( dir, Dir.pwd() )
  end
end
