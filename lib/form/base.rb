require "#{Rails.root}/lib/form/field"

module Form
  class Base
    include ActiveModel::Model

    def fields_for(resource)
      fields.select { |field| field.resource == resource.to_s.underscore }
    end

    def self.resource(resource)
      @current_resource = resource.to_s.underscore
      resources << @current_resource
      create_resource_setter(@current_resource)
      yield if block_given?
      create_attributes_method(@current_resource)
    end

    def self.field(name, type: :string)
      field = Form::Field.new(name, resource: @current_resource, type: type)
      fields << field
      create_attr_accessor(field.full_name)
      field
    end

    def self.fields
      @fields ||= []
    end

    def fields
      self.class.fields
    end

    def self.resources
      @resources ||= []
    end

    def resources
      self.class.resources
    end

    def self.create_attr_accessor(name)
      class_eval do
        attr_accessor name
      end
    end

    def self.create_resource_setter(resource_name)
      define_method "#{resource_name}=" do |resource|
        fields_for(resource_name).each do |field|
          value = resource.public_send(field.name)
          public_send("#{field.full_name}=", value)
        end
      end
    end

    def self.create_attributes_method(resource_name)
      define_method "#{resource_name}_attributes" do
        attributes = {}
        fields_for(resource_name).each do |field|
          attributes[field.name] = public_send(field.full_name)
        end
        attributes
      end
    end
  end
end
