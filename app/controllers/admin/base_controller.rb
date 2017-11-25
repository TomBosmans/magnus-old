require "#{Rails.root}/lib/resource_resolver"

module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!

    def index
      @resources = resource_class.all
    end

    def show
      @resource = requested_resource
    end

    def new
      @resource = resource_class.new
    end

    def create
      @resource = requested_resource.new(resource_params)

      if resource.save
        redirect_to [namespace, @resource]
      else
        render :new
      end
    end

    def edit
      @resource = requested_resource
    end

    def update
      @resource = requested_resource

      if @resource.update(resource_params)
        reditect_to [namespace, @resource]
      else
        render :edit
      end
    end

    def destroy
      requested_resource.destroy
      redirect_to action: :index
    end
 
    private

    def requested_resource
      resource.find(params[:id])
    end

    delegate :resource_class, :namespace, to: :resource_resolver

    def resource_resolver
      @resource_resolver ||= ResourceResolver.new(controller_path)
    end
  end
end
