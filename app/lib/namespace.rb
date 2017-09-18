class Namespace
  MAIN_RESOURCES = [:settings, :users].freeze

  def initialize(namespace)
    @resources = Administrate::Namespace.new(namespace).resources
  end

  def main_resources
    @resources.select  { |object|  MAIN_RESOURCES.include? object.resource.to_sym }
  end

  def other_resources
    @resources.reject { |object|  MAIN_RESOURCES.include? object.resource.to_sym }
  end
end
