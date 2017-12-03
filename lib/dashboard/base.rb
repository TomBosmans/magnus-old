require 'dashboard/attribute'

module Dashboard
  class Base
    def self.attribute(new_attributes={})
      new_attributes.each do |name, type|
        attributes << Dashboard::Attribute.new(name, type: type)
      end
    end

    def self.attributes
      @attributes ||= []
    end

    def self.show_page(*args)
      @show_page_attributes = args
    end

    def self.show_page_attributes
      @show_page_attributes ||= attributes
    end

    def self.index_page(*args)
      @index_page_attributes = args
    end

    def self.index_page_attributes
      @index_page_attributes ||= attributes
    end

    def self.edit_page(*args)
      @edit_page_attributes = args
    end

    def self.edit_page_attributes
      @edit_page_attributes ||= attributes
    end

    def self.new_page(*args)
      @new_page_attributes = args
    end

    def self.new_page_attributes
      @new_page_attributes ||= attributes
    end
  end
end
