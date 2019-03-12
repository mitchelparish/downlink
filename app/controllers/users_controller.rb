class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect to 'users/show'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
        session[:user_id] = @user.id
        redirect to '/users/show'
      end
    end

    get '/login' do
      if !logged_in?
        erb :'login'
      else
        redirect '/users/show'
      end
    end

    post '/login' do
      user = User.find_by(:username => params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/users/show"
      else
        redirect to '/signup'
      end
    end

    get '/logout' do
      if logged_in?
        session.destroy
        redirect to '/login'
      else
        redirect to '/index'
      end
    end
  end
