class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    farmer = Farmer.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in to account!'

    elsif farmer && farmer.authenticate(params[:password])
      session[:farmer_id] = farmer.id
      redirect_to '/farmers', notice: 'Logged in to farmer account!'

    else
      flash.now.alert = 'Invalid login credentials - try again!'

      #starts over
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    session[:farmer_id] = nil
    ##goes to homepage
    redirect_to root_path, notice: "Logged out!"
  end





end

