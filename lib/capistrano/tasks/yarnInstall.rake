
desc "install yarn in current release dir"
task :yarnInstall do
  on roles(:all) do |host|
    within "#{release_path}" do
      info "#{capture(:pwd)}"
      # execute "yarn install"
    end
  end
end
