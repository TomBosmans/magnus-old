# Assume that the controller_path has a namespace (like admin/)
# TODO: Get list of all used namespaces and check if there is one or not
class ResourceResolver
  attr_reader :controller_path

  def initialize(controller_path)
    @controller_path = controller_path
  end

  def resource_class
    ActiveSupport::Inflector.constantize(resource_class_name)
  end

  def namespace
    controller_path_parts.first
  end

  def dashboard
    ActiveSupport::Inflector.constantize("#{resource_class}Dashboard")
  end

  private

  def controller_path_parts
    @controller_path.split('/')
  end

  def model_path_parts
    parts = controller_path_parts[1..-1]  # remove namespace part
    parts[-1] = parts.last.singularize    # singularize last part
    parts
  end

  def resource_class_name
    model_path_parts.map(&:camelize).join("::")
  end
end
