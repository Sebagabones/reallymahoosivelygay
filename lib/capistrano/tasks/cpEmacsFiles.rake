#!/usr/bin/env ruby

newarray=%w{config.el packages.el init.el};
desc "Copies files to webserver"
task :cpEmacsFiles do
  on roles(:all) do |host|
    newarray.each do |file|
      info "Copying #{file}"
      dirPath ="/var/www/mahoosively.gay/public_html/emacsConfig/current/#{file}"
      execute :cp, "#{dirPath}", "#{release_path}/public/codeFiles/emacsConfFiles"
    end
  end
end
