desc 'Signup'
task :signup => :environment do
  DEFAULT_PASSWORD = 'test'
  User.create!(:username => ENV['username'], :email => ENV['email'], :password => DEFAULT_PASSWORD, :password_confirmation => DEFAULT_PASSWORD)
  puts '用户创建成功'
end

