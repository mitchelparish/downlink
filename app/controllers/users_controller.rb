class UsersController < ApplicationController

  # get '/users/:slug' do         # Can this go somewhere else in the flow?
  #    @user = User.find_by_slug(params[:slug])
  #    erb :'users/show'
  #  end

  get '/users/show' do
     erb :'users/show' # needs @user variable set
   end


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
        erb :'users/login'
      else
        redirect '/users/show'
      end
    end

    post '/login' do
      user = User.find_by(:username => params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/users/show'
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
