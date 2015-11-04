class WelcomeController < ApplicationController
  def index
  end

  private
    helper_method :current_user

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end

