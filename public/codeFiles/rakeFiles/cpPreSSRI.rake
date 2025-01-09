#!/usr/bin/env ruby

newarray=%w{config.el.html packages.el.html init.el.html};
desc "Copies files to right location before ssri"
task :cpPressri do
  on roles(:all) do |host|
    newarray.each do |file|
      info "Copying #{file}"
      dirPath ="#{release_path}/#{file}"
      execute :cp, "#{dirPath}", "/webserver/dir/path/"
    end
  end
  invoke(:ssriRun)
end
