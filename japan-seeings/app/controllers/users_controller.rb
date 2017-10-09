class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/spots'
    else
    erb :'users/create'
    end
  end

  post '/signup' do
    redirect '/signup' if params[:username] == ""
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/spots'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/spots'
    end
  end

  post '/login' do
    if logged_in?
      redirect '/spots'
    else
      @user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect '/spots'
      else
       redirect '/login'
      end
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/login'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

end
