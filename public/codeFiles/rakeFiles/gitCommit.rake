#!/usr/bin/env ruby

desc 'push local repo to git'
task :gitpush do
  run_locally do
    timeOfPushCommitMessage = "#{capture(:date)}"
    execute :git, "add", "."
    execute :git, "commit", "-m", "'", "#{timeOfPushCommitMessage}", "'"
    execute :git, "push"

  end
end
