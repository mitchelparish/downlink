class DownlinksController < ApplicationController



  get '/downlinks/new' do
      erb :"downlinks/new"
    end
end
