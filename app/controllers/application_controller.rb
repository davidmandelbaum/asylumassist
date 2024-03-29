class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    if current_user
      if params[:locale]
        current_user.locale = params[:locale]
        current_user.save
      elsif session[:locale]
        current_user.locale = session[:locale]
        current_user.save
      end
      case current_user.locale
      when "en"
        I18n.locale = :en
      when "es"
        I18n.locale = :es
      when "zh"
        I18n.locale = :zh
      end
    else
      session[:locale] = params[:locale]
      case session[:locale]
      when "en"
        I18n.locale = :en
      when "es"
        I18n.locale = :es
      when "zh"
        I18n.locale = :zh
      end
    end
  end
end
