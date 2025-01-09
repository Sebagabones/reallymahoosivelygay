#!/usr/bin/env ruby

desc "Report Uptimes"
task :uptime do
  on roles(:all) do |host|
    info "Running task on #{host}, deploying at #{fetch(:deploy_to)}"
        info "Host #{host} (#{host.roles.to_a.join(', ')}):\t#{capture(:uptime)}"
  end
end
