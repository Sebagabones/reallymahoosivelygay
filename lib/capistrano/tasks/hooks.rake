#!/usr/bin/env ruby
 before 'deploy:starting', :gitCommitUpdate

 after 'deploy:updated', :yarnInstall
