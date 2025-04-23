require 'sinatra/reloader'
require "./models.rb"
require 'sinatra/base'
require 'sinatra/namespace'

class LiTBooks < Sinatra::Base
  register Sinatra::Namespace
  get '/' do
  'LiT! Books!'
  end

  namespace '/books' do
    get '/?' do
      @books = Book.all
      @books = @books.order('created_at DESC')
      @books = @books.limit(10)
      erb :'books/index'
    end

    get '/new' do
      erb :'books/new'
    end

    get '/:id' do
      '書籍詳細'
    end
  end

end