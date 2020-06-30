source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', "~> 5.2", :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'bcrypt'
gem 'rack-flash3'
gem 'dotenv'
gem 'foreman'

group :production do
  gem 'pg', '~> 0.20'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
  gem 'puma'
  gem 'tux'
  gem 'shotgun'
  gem 'pry'
  gem 'faker'
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end
