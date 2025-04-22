require 'sinatra/base'
require 'sinatra/namespace'

class LiTBooks < Sinatra::Base
  register Sinatra::Namespace
  get '/' do
  'LiT! Books!'
  end

  namespace '/books' do
    get '/?' do
      '書籍一覧'
    end

    get '/new' do
      '新規書籍登録'
    end

    get '/:id' do
      '書籍詳細'
    end
  end

end