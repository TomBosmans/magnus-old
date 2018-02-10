module FlashHelper
  def flash_icon_for(type)
    types = {
      success: 'fa-check',
      error: 'fa-times',
      alert: 'fa-exclamation',
      notice: 'fa-info'
    }

    types[type.to_sym]
  end
end
