require 'sinatra/base'
require 'sinatra/namespace'

class LiTBooksAPI < Sinatra::Base
  register Sinatra::Namespace

  namespace '/books' do
    post '/new' do
    end

    put '/:id' do
    end

    delete '/:id' do
    end
  end

end