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

@options = {
  is_dev: -1,
  save: {
    dir: nil
  },
}

OptionParser.parse do |parser|
  parser.banner( "Usage: via [options] [file]\n\nOptions:" )
  parser.on( "-h", "--help", "Show help" ) do
      puts parser
      exit
  end
  parser.on( "-v", "--version", "Show version" ) do
    puts "Version is 1.0b1 (2022-07-22)"
    exit
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
