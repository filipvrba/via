def absolute_path(relative_path)
  File.absolute_path(relative_path, __FILE__)
end