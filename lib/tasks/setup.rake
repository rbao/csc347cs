namespace :demo do
  task :setup => ['db:drop', 'db:create', 'db:migrate', 'db:seed']
end