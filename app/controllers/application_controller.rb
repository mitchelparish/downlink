require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret" # change later, see what impacts changes might have?
  end

  get '/' do
    erb :index
  end

  helpers do
    # def redirect_if_not_logged_in
    #   if !logged_in?
    #     redirect "/login?error=You have to be logged in to do that"
    #   end


    def logged_in?         # look at fwitter example, !!current_user
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end 
