class SpotsController < ApplicationController

  get '/spots' do
    if logged_in?
      @spots = Spot.all
      erb :'spots/spots'
    else
      redirect to '/login'
    end
  end

  get '/spots/new' do
    if logged_in?
      erb :'spots/create_spot'
    else
      redirect to '/login'
    end
  end

  post '/spots' do
    if logged_in?
      if params[:name] != "" && params[:location] != "" && params[:visited] != "" && params[:rating] != ""
        @spot = current_user.spots.create(:name => params[:name], :location => params[:location], :visited => params[:visited], :rating => params[:rating])
        redirect '/spots'
      else
        redirect to '/spots/new'
      end
    else
      redirect to '/login'
    end
  end

  get '/spots/:id' do
    if logged_in?
      @spot = Spot.find_by_id(params[:id])
      erb :'spots/show_spot'
    else
      redirect "/login"
    end
  end
