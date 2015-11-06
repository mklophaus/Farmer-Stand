class ProductsController < ApplicationController

  before_action :authorize, except: [:index]

  before_action :set_product, only: [:show, :edit, :update, :destroy]


  def index

   # binding.pry
  if current_user.type == "Farmer"
      @products = current_user.products
    else
      @products = Product.all
      @shopping_cart = session[:cart]
    end

  end

  def show
  end

  def new
   # @order = Order.find_by_id(params[:id])
    @product = Product.new
  end

  def edit
  end

  def create
    @product = current_user.products.build product_params
    #FIRST WAY  @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end

  end

  def update
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.'
       # render :show
      else
        render :edit
      end
  end

  def destroy
    @product.destroy
      redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    default_params = params.require(:product).permit(:category, :price, :taste_description, :quantity)
    name = params[:name][ params[:product][:category].downcase  ]
    default_params["name"] = name
    default_params
  end
end
