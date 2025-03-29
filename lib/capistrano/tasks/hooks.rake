#!/usr/bin/env ruby
before 'deploy:starting', :gitCommitUpdate

# before 'deploy:symlink:release', :cpEmacsFiles
after 'deploy:symlink:release', :yarnInstall
after 'deploy:symlink:release', :yarnBuild
after 'deploy:symlink:release', :cpCurrentReleaseToPM2Dir
