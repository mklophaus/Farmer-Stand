class UsersController < ApplicationController

  def index
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
      flash[:notice] = "You have successfully signed up!"

        redirect_to users_path
    else
      render :new
    end

  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'Account was successfully updated.'
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

