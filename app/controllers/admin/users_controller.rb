module Admin
  class UsersController < Admin::ApplicationController
    def default_params
      params[:order] ||= 'email'
      params[:direction] ||= 'asc'
    end
  end
end
