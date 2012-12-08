class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def set_locale
    # logger.debug "----params[:locale] #{params[:locale]}--------------"
    ::I18n.locale = params[:locale] || 'en'
  end
end
