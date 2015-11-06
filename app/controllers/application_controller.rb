class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
      #helper method gives access from inside a view
      helper_method :current_user, :cart, :cart_products, :is_in_cart?

      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end

      def authorize
        redirect_to login_path, alert: 'Not authorized - you must be logged in!' if current_user.nil?
      end

      def cart
        session[:cart] ||= []
      end

      def cart_products
        cart.map {|id| Product.find_by_id(id)}
      end

      def is_in_cart?(id)
        cart.include? id.to_s
      end

end
