module Presenter
  class Attribute
    attr_accessor(
      :page,
      :name,
      :type
    )

    def initialize(name, page, args={})
      @name = name
      @page = page
      @type = args[:type]
    end
  end
end
