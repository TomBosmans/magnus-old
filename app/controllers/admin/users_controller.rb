module Admin
  class UsersController < Admin::BaseController
    def default_params
      params[:order] ||= 'email'
      params[:direction] ||= 'asc'
    end
  end
end
