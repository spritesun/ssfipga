namespace :db do
  desc 'Load demo data'
  task :load_demo_data => 'db:fixtures:load' do
    include DataLoader
    load_demo_data
  end

  namespace :test do
    desc 'Load demo data into test database'
    task :load_demo_data do
      system 'rake db:load_demo_data RAILS_ENV=test'
    end
  end
end