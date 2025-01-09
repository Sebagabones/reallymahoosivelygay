#!/usr/bin/env ruby

namespace :pygments do
  ARRAY=%w{config.el packages.el init.el};
  desc "Runs pygments on config files"
  task :pygmentsSetup do
    on roles(:all) do |host|
      info "Running pygments on #{host}"
      ARRAY.each do |file|
        info "running pygmentize on #{file}"
        dirPath ="#{release_path}/#{file}"
        dirPathHTML="#{dirPath}.html"
        execute :pygmentize, "#{dirPath}", "-O", "cssclass=syntax", "-o", "#{dirPathHTML}"

      end
    end
    invoke(:cpPressri)
  end
end
