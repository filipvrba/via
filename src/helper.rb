def absolute_path(relative_path)
  File.absolute_path(relative_path, __FILE__)
end

def p_header(name)
  identation = 10
  puts "=" * identation + name + "=" * identation
end

def p_dev(data, name)


  p_header(FILE_TYPES[:erb].upcase)
    top_down = -> () {"+#{"-" * (name.length)}+"}

  puts top_down.()
  puts "|#{name}|"
  puts top_down.()
  puts data
  puts
end
