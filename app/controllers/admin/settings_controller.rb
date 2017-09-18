module Admin
  class SettingsController < Admin::ApplicationController
    def index
      render :edit, locals: { page: Administrate::Page::Form.new(dashboard, Setting.first) }
    end

    def update
      if requested_resource.update(resource_params)
        redirect_to(
          [:edit, namespace, requested_resource],
          notice: translate_with_resource("update.success"),
        )
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource),
        }
      end
    end
  end
end
