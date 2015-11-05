class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user.type == "Purchaser" && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, notice: 'Logged in to account!'

    elsif user.type == "Farmer" && user.authenticate(params[:password])
      session[:user_id]= user.id
      redirect_to users_path, notice: 'Logged in to account!'

    else
      flash.now.alert = 'Invalid login credentials - try again!'

      #starts over
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    ##goes to homepage
    redirect_to root_path, notice: "Logged out!"
  end


end

