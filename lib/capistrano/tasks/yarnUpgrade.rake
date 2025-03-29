#!/usr/bin/env ruby
desc "Upgrading Astro"
task :yarnUpgrade do
  on roles(:all) do |host|
    within "#{release_path}" do
      info "Upgrading Astro"
      execute :yarn, "dlx", "@astrojs/upgrade"
    end
  end
end
