class UsersController < ApplicationController

  def index
  end


  def new
    @user = User.new
  end


  def create

    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up!"

      if @user.is_a? Farmer
        redirect_to farmers_path
      else
        redirect_to root_path
      end

    else
      render 'new'
    end

  end


  private

  def user_params

    params.require(:user).permit(
      :name,
      :email,
      :type,
      :business_name,
      :postal_code,
      :password,
      :password_confirmation)

  end


end

