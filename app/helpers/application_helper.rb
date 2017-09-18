module ApplicationHelper
  def flash_icon_for(type)
    { success: "fa-check", error: "fa-times", alert: "fa-exclamation", notice: "fa-info" }[type.to_sym]
  end

  def input_required?(object, attribute)
    presence_validators = [ActiveModel::Validations::PresenceValidator, ActiveRecord::Validations::PresenceValidator]
    target = (object.class == Class) ? object : object.class
    target.validators_on(attribute).map(&:class).any? { |x| presence_validators.include?(x) }
  end

  def input_error?(object, attribute)
    object.errors.include?(attribute.to_sym)
  end
end
