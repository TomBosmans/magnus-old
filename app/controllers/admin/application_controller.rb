# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_filter :default_params
    helper_method :settings

    def settings
      Setting.first
    end

    private

    def default_params
      params[:order] ||= 'created_at'
      params[:direction] ||= 'desc'
    end
  end
end
