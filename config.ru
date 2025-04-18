require 'rubygems'
require 'bundler'

Bundler.require

require 'sinatra/reloader'
require './app.rb'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:development)
Time.zone = 'Tokyo'
ActiveRecord::Base.default_timezone = :local

run Sinatra::Application