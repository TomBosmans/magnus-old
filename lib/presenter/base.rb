require "#{Rails.root}/lib/form/attribute"

module Presenter
  class Base
    attr_accessor :resources

    def initialize(resources)
      @resources = resources
    end

    def self.page(name)
      @current_page = name.to_sym
      pages << page
      yield if block_given?
      page
    end

    def self.attribute(name, args={})
      type = args[:type] || find_type_for(name)
      attribute = Presenter::Attribute.new(name, @current_page, args)
      attributes << attribute
      attribute
    end

    def self.pages
      @pages ||= []
    end

    def pages
      self.class.pages
    end

    def attributes_for(page)
      attributes.select { |attribute| attribute.page == page.to_sym }
    end

    def self.attributes
      @attributes ||= []
    end

    def attributes
      self.class.attributes
    end

    private

    def model_class
      self.class.to_s.slice!('Presenter').constantize
    end

    def db_column_info_for(column_name)
      array = model_class.columns_hash.detect { |k,_| k == column_name }
      array ? array.last : nil
    end

    def find_type_for(name)
      db_column_info = db_column_info_for(name)
      db_column_info ? db_column_info.type : 'string'
    end
  end
end
