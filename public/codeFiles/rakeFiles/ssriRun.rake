#!/usr/bin/env ruby

mainDirLoc = "/webserver/dir/path/"
desc "Runs ssri"
task :ssriRun do
  on roles(:all) do |host|
    info "Running SSRI on #{host}"
    staging = "#{mainDirLoc}/staging"
    templates = "#{mainDirLoc}/templates"
    sites = "#{mainDirLoc}/sites"
    execute :ssri, "-d", "#{staging}", "-t", "#{templates}", "-o", "#{sites}", "--no-warnings", "-c"

  end
end
