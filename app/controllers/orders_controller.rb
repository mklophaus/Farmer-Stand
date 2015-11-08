class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def show
    #@orders = current_user.orders
    @order = cart
  end

  def new
   # @order = Order.find_by_id(params[:id])
    @order = Order.new
    @products = current_user.products
  end

  def create
    @order = current_user.orders.build order_params
    if @order.save
    #  redirect_to , notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def order_params
    params.require(:product).permit(:product)
  end

end


