class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  helper_method :current_user
  helper_method :user_signed_in?

  private

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def current_user
      if session[:user_id]
        @current_user ||= User.find_by_id( session[:user_id] )
      else
        @current_user = User.find_by_name( "anonym" )
      end
    end

    def user_signed_in?
      return 1 if current_user
    end

    def authenticate_user!
      if !current_user
        flash[:error] = "You need to sign in before accessing this page!"
        redirect_to signin_services_path
      end
    end
end

