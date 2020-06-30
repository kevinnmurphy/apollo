ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
require 'dotenv/load' if ENV['SINATRA_ENV'] == "development"

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )

set :database_file, "./database.yml"

require 'rack-flash'

require './app/controllers/application_controller'
require_relative "../app/models/concerns/searchable.rb"
require_all 'app'

