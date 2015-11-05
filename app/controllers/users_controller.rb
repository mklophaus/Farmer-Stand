class UsersController < ApplicationController
  before_action :authenticate, only: [:index, :edit, :update]
  before_action :authorize, only: [:index, :edit, :update, :create]

  def index
    @user = User.find_by_id(params[:id])
    #binding.pry
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
      #if @user.is_a? Farmer
      #  redirect_to root_path
      #else
        redirect_to users_path
     # end
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

 def authenticate
      redirect_to new_session_path, alert: 'You must be logged in to continue!' if current_user.nil?
    end

end

