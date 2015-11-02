class FarmersController < ApplicationController
  def index
  end


  def new
    @farmer = Farmer.new
  end

  def create
    @farmer = Farmer.new(farmer_params)
      if @farmer.save
        flash[:notice] = "You have successfully signed up!"
        redirect_to root_path
      else
        render 'new'
      end

  end

  private

  def farmer_params

    params.require(:farmer).permit(:name, :business, :zip_code, :email, :password, :password_confirmation)

  end



end
