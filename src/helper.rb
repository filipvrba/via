def absolute_path(relative_path)
  File.absolute_path(relative_path, __FILE__)
end

def p_header(name)
  identation = 10
  puts "=" * identation + name + "=" * identation
end

def p_dev( data_files )

  p_header("ERB")
  data_files.reverse_each do |name, data|
    top_down = -> () {"+#{"-" * (name.length)}+"}

    puts top_down.()
    puts "|#{name}|"
    puts top_down.()
    puts data
  end
  p_header("===")
end
