class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: 'Logged in to account!'

    else
      flash.now.alert = 'Invalid login credentials - try again!'

      #starts over
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    session[:cart] = nil
    redirect_to root_path, notice: "Logged out!"
  end


  def add_to_cart
    cart.push(params[:product_id])
    redirect_to products_path
  end

  def shopping_cart
    render :cart
  end

end

