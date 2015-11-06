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
    redirect_to root_path, notice: "Logged out!"
  end

  def products_in_cart
    shopping_cart.map {|id| Product.find_by_id(id)}
  end

  def shopping_cart
    # render plain: params
    session[:cart] ||= []
    session[:cart].push(params[:product_id])
    redirect_to user_path(current_user)
  end



end

