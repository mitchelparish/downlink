class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if logged_in? && current_user.id == @user.id
      erb :'users/show'
    else
      redirect to "/"
    end
  end

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect to "/users/#{current_user.slug}"
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
        session[:user_id] = @user.id
        redirect to "/users/#{current_user.slug}"
      end
    end

  get '/login' do
      if !logged_in?
        erb :'users/login'
      else
        redirect "/users/#{current_user.slug}"
      end
    end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{current_user.slug}"
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      erb :index
    else
      erb :index
    end
  end
end
