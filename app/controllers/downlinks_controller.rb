class DownlinksController < ApplicationController

#   get '/downlinks/new' do
#       erb :"downlinks/new"
#     end
# end
  # get '/downlinks/show' do
  #   if logged_in?
  #     @downlinks = Downlink.all
  #     erb :'downlinks/show'
  #   else
  #     redirect to '/login'
  #   end
  # end

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
        redirect to "/downlinks/#{@downlink.id}" #erb?
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

  # get '/downlinks/:id/edit' do
  #   if logged_in?
  #     @downlink = Downlink.find_by_id(params[:id])
  #     if @downlink && @downlink.user == current_user
  #       erb :'downlinks/edit'
  #     else
  #       redirect to 'users/show'
  #     end
  #   else
  #     redirect to '/login'
  #   end
  # end

  # patch '/downlinks/:id' do
  #   if logged_in?
  #     if params[:content] == "" # or || any other param empty
  #       redirect to "/downlinks/#{params[:id]}/edit"
  #     else
  #       @downlink = Downlink.find_by_id(params[:id])
  #       if @downlink && @downlink.user == current_user
  #         if @downlink.update(content: params[:content])
  #           redirect to "/downlinks/#{@downlink.id}"
  #         else
  #           redirect to "/downlinks/#{@downlink.id}/edit"
  #         end
  #       else
  #         redirect to '/users/show'
  #       end
  #     end
  #   else
  #     redirect to '/login'
  #   end
  # end

  # delete '/downlinks/:id/delete' do
  #   if logged_in?
  #     @downlink = Downlink.find_by_id(params[:id])
  #     if @downlink && @downlink.user == current_user
  #       @downlink.delete
  #     end
  #     redirect to "/users/#{current_user.slug}"
  #   else
  #     redirect to '/login'
  #   end
  # end
end
