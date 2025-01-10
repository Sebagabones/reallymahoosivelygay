
desc 'Pull repo, commit any changes, asking for commit message, then push'
task :gitCommitUpdate do
  ask(:gitCommitMsg, prompt:"Please enter your commit message")
     run_locally do
       info "#{capture(:whoami)}  #{fetch(:gitCommitMsg)}"
       execute "git commit -a -m \"#{fetch(:gitCommitMsg)}\""
       execute "git pull"
       execute "git push"
     end
end
