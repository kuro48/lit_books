require 'sinatra/reloader'
require "./models.rb"
require 'sinatra/base'
require 'sinatra/namespace'

class LiTBooksAPI < Sinatra::Base
  register Sinatra::Namespace

  namespace '/books' do
    post '/new' do
      title = params[:title]
      author = params[:author]
      publisher = params[:publisher] || ""
      cover_image_url = params[:cover_image_url] || ""
      description = params[:description] || ""

      Book.create(
        uid: SecureRandom.uuid,
        title: title,
        author: author,
        publisher: publisher,
        cover_image_url: cover_image_url,
        description: description
      )

      redirect '/books'
    end

    put '/:id' do
    end

    delete '/:id' do
    end
  end

end