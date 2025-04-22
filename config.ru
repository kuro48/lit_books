require 'rubygems'
require 'bundler'

Bundler.require

require 'sinatra/reloader'
require_relative 'app'
require_relative 'api'

root_path = '/'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:development)
Time.zone = 'Tokyo'

map (root_path){run LiTBooks}
map (root_path + 'api/v1'){run LiTBooksAPI}