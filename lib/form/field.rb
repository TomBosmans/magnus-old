module Form
  class Field
    attr_accessor :name, :resource, :type

    def initialize(name, resource:, type:)
      @name = name
      @resource = resource
      @type = type
    end

    def full_name
      "#{resource}_#{name}"
    end
  end
end
