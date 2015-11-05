class UsersController < ApplicationController

  def index

  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
   @user = User.new
  end

  def edit
    @user = User.find_by_id(params[:id])
    @user = @user.becomes User
    # binding.pr
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up!"

        redirect_to user_path(@user.id)
    else
      render :new
    end

  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: 'Account was successfully updated.'
      # render :show
    else
      render :edit
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

