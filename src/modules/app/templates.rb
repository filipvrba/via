def rails_templates_install
  all_path = all_path_files()

  unless rails_files?(all_path.rails)
    puts "This project is not for an rails!"
  else

    files = get_files(all_path)

    files.each_with_index do |f,i|
      template   = f[i][:template]
      rails      = f[i][:rails]
      i_row_end  = rails.index("end\n")

      template_fix_tab = template.map { |r| " " * 2 + r }
      templated_rails  = rails.insert(i_row_end, template_fix_tab)

      if set_data_file(templated_rails, all_path.rails[i])
        puts "This '#{all_path.files[i]}' by modified."
      end
    end

    puts "Modified project, was successful."
  end
end

def get_files(all_path)
  all_path.files.map.with_index do |path, i|
    {
      i => {
        template: get_data_file(all_path.template[i]),
        rails:    get_data_file(all_path.rails[i])
      }
    }
  end
end

def get_data_file(path)
  if File.exist?(path)
    File.open(path) do |f|
      f.readlines
    end
  else
    nil
  end
end

def set_data_file(data, path)
  if File.exist?(path)
    f = File.new(path, "w+")
    f.write data.join
    f.close
    path
  else
    nil
  end
end

def rails_files?(path_files)
  exist_rails_files = path_files.select { |path| File.exist?(path) }
  exist_rails_files.length == path_files.length
end

def all_path_files
  path_files          = get_path_files
  path_template_files = path_files.map { |path| File.join(abspath_template(), path) }
  path_rails_files    = path_files.map { |path| File.join(Dir.pwd, path) }

  Struct.new(:files, :template, :rails).new(path_files, path_template_files, path_rails_files)
end

def get_path_files
  abspath = abspath_template()
  relpath_files = Dir.glob("#{abspath}/**/*.rb").map do |path|
    path.sub("#{abspath}/", '')
  end
end

def abspath_template
  File.absolute_path("../../../../#{TEMPLATE_PATH}", __FILE__)
end
