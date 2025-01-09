#!/usr/bin/env ruby
before 'deploy:starting', :uptime
before 'deploy:starting', :gitpush


after 'deploy:updated', 'pygments:pygmentsSetup'
