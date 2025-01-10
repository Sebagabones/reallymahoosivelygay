#!/usr/bin/env ruby
 before 'deploy:starting', :gitCommitUpdate

 after 'deploy:symlink:release', :yarnInstall
