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
      if params[:name] != "" && params[:location] != "" && params[:time_of_visit] != "" && params[:rating] != ""
        @spot = current_user.spots.create(:name => params[:name], :location => params[:location], :time_of_visit => params[:time_of_visit], :rating => params[:rating], :comments => params[:comments])
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

  get '/spots/:id/edit' do
    if logged_in?
      @spot = current_user.spots.find(params[:id])
      erb :'/spots/edit_spot'
    else
      redirect "/login"
    end
  end

  patch '/spots/:id' do
    if logged_in?
      @spot = current_user.spots.find(params[:id])
      if params[:name] != "" && params[:location] != "" && params[:time_of_visit] != "" && params[:rating] != ""
        @spot.update(:name => params[:name], :location => params[:location], :time_of_visit => params[:time_of_visit], :rating => params[:rating], :comments => params[:comments])
        redirect "/spots/#{@spot.id}"
      else
        redirect "/spots/#{@spot.id}/edit"
      end
    else
      redirect "/login"
    end
  end

  delete '/spots/:id/delete' do
    if logged_in?
      @spot = Spot.find(params[:id])
      if @spot.user_id == current_user.id
        @spot.delete
        redirect '/spots'
      else
        redirect '/spots'
      end
    else
      redirect '/login'
    end
  end

end
