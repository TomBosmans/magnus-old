
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
  helper_method :settings

  def settings
    Setting.first
  end

  private

  def layout_by_resource
    if devise_controller?
      'authentication'
    else
      'application'
    end
  end
end
