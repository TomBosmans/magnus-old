module ApplicationHelper
  def flash_icon_for(type)
    { success: "fa-check", error: "fa-times", alert: "fa-exclamation", notice: "fa-info" }[type.to_sym]
  end
end
