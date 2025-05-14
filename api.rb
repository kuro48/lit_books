require 'sinatra/reloader'
require "./models.rb"
require 'bcrypt'
require 'securerandom'
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

  namespace '/auth' do
    post '/signup' do
      name = params[:name]
      user_name = params[:user_name]
      email = params[:email]
      password = params[:password]

      User.create(
        uid: SecureRandom.uuid,
        name: name,
        user_name: user_name,
        email: email,
        password_digest: BCrypt::Password.create(password)
      )

      redirect '/books'
    end

    post '/signin' do
      email = params[:email]
      password = params[:password]

      user = User.find_by(email: email)

      if user && BCrypt::Password.new(user.password_digest) == password
        session[:user_uid] = user.uid
        redirect '/books'
      else
        redirect '/auth/signin'
      end
    end

    post '/signout' do
      session[:user_uid] = nil
      redirect '/'
    end
  end

end