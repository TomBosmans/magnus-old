module Admin
  class SettingsController < Admin::ApplicationController
    
    def index
      render locals: { page: Administrate::Page::Show.new(dashboard, Setting.first), }
    end
  end
end
