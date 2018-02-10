require "#{Rails.root}/lib/resource_resolver"

class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
end
