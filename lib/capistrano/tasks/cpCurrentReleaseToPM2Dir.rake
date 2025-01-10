#!/usr/bin/env ruby


desc "Copies files to right location for pm2 to use"
task :cpCurrentReleaseToPM2Dir do
  on roles(:all) do |host|
      dirPath ="#{release_path}/."
      execute :cp, "-a",  "#{dirPath}", "/var/www/mahoosively.gay/public_html/astroSite/pm2Dir"
  end

end
