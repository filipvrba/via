def initialize
  super

  if Rails.application.config.active_via
    dir_names = ["layouts"]
    dir_names.append self.class.name.downcase.sub("controller", "")

    dir_names.each do |dir_name|
      relative_path = "app/views/#{dir_name}"
      system("via -s #{relative_path} #{relative_path}/vias")
    end
  end
end
