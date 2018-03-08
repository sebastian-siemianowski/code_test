namespace :test do
  desc 'Test github connection remotly'
  task :github do
    on roles(:all) do
      execute 'ssh -T git@github.com || :'
    end
  end
end
