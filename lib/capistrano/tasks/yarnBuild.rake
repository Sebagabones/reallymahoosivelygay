
desc "Build dist in current release dir"
task :yarnBuild do
  on roles(:all) do |host|
    within "#{release_path}" do
      info "Building in #{release_path}"
      execute :yarn, "run", "build"
    end
  end
end
