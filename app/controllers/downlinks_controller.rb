class DownlinksController < ApplicationController

  get '/downlinks/new' do
    if logged_in?
      erb :'downlinks/new'
    else
      redirect to '/login'
    end
  end

  post '/downlinks/new' do
    if logged_in?
      @downlink = Downlink.create(title: params[:title], signal_strength: params[:signal_strength], message: params[:message])
      @downlink.user = current_user
      @downlink.save
        redirect to "/downlinks/#{@downlink.id}"
    else
      redirect to "/login"
    end
  end

  get '/downlinks/:id' do
    if logged_in?
      @downlink = Downlink.find_by_id(params[:id])
      erb :'downlinks/show'
    else
      redirect to '/login'
    end
  end

  get '/downlinks/:id/edit' do
    if logged_in?
      @downlink = Downlink.find_by_id(params[:id])
      if @downlink && @downlink.user == current_user
        erb :'downlinks/edit'
      else
        redirect to "/users/#{current_user.slug}"
      end
    else
      redirect to '/login'
    end
  end

  patch '/downlinks/:id' do
    @downlink = Downlink.find_by_id(params[:id])
    @downlink.update(title: params[:title], signal_strength: params[:signal_strength],
      message: params[:message])
    @downlink.save
    redirect to "/downlinks/#{@downlink.id}"
  end

  delete '/downlinks/:id/delete' do
    if logged_in?
      @downlink = Downlink.find_by_id(params[:id])
      if current_user.id == @downlink.user_id
        @downlink.delete
      end
      redirect to "/users/#{current_user.slug}"
    else
      redirect to '/login'
    end
  end
end
