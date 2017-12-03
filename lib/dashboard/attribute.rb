module Dashboard
  class Attribute
    attr_reader :name, :type

    def initialize(name, type: :string)
      @name = name
      @type = type
    end
  end
end
