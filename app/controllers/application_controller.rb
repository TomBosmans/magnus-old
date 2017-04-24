class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :settings

  def settings
    Setting.first
  end
end
