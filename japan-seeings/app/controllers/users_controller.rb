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

end
