require 'rack-flash'

class SpotsController < ApplicationController
  use Rack::Flash

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
      @spot = current_user.spots.build(params[:spot])
      if @spot.save
        redirect '/spots'
      else
        flash[:message] = "Failed to save spot, you must fill in the boxes"
        redirect to '/spots/new'
      end
    else
      redirect to '/login'
    end
  end

  get '/spots/:id' do
    if logged_in?
      if @spot = Spot.find_by_id(params[:id])
        erb :'spots/show_spot'
      else
        flash[:message] = "This Spot doesn't exist."
        redirect '/spots'
      end
    else
      redirect "/login"
    end
  end

  get '/spots/:id/edit' do
    if logged_in?
      if @spot = current_user.spots.find_by(id: params[:id])
        erb :'/spots/edit_spot'
      else
        flash[:message] = "This Spot doesn't belong to you."
        redirect '/spots'
      end
    else
      redirect "/login"
    end
  end

  patch '/spots/:id' do
    if logged_in?
      if @spot = current_user.spots.find(params[:id])
        if @spot.update(params[:spot])
          redirect "/spots/#{@spot.id}"
        else
          flash[:message] = "Failed to save spot, you must fill in the boxes"
          redirect "/spots/#{@spot.id}/edit"
        end
      else
        flash[:message] = "This Spot doesn't belong to you."
        redirect '/spots'
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
        flash[:message] = "This Spot doesn't belong to you."
        redirect '/spots'
      end
    else
      redirect '/login'
    end
  end

end
