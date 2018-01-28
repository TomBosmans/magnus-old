require "#{Rails.root}/lib/resource_resolver"

class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!

  def index
    @resources = resource_class.all
  end

  def show
    @resource = requested_resource
  end

  def new
    @form = new_form_class.new
  end

  def create
    edit_form_class.create(resource_params) do |form, resource|
      if @resource = resource
        redirect_to [namespace, @resource]
      else
        render :new, locals: { form: form }
      end
    end
  end

  def edit
    @form = edit_form_class.new
    @form.public_send(resource_class.to_s.underscore, requested_resource)
  end

  def update
    edit_form_class.update(requested_resource, params) do |form, resource|
      if @resource = resource
        redirect_to [namespace, @resource]
      else
        render :edit, locals: { form: form }
      end
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

  delegate :resource_class, :namespace, :dashboard, to: :resource_resolver
  delegate :new_form_class, :edit_form_class, to: :dashboard

  def resource_resolver
    @resource_resolver ||= ResourceResolver.new(controller_path)
  end
end
