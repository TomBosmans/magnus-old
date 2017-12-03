require 'test_helper'
require "#{Rails.root}/lib/resource_resolver"

describe ResourceResolver do
  describe '#controller_path' do
    it 'returns the controller path' do
      controller_path = 'admin/articles'
      resource_resolver = ResourceResolver.new(controller_path)
      assert_equal resource_resolver.controller_path, controller_path
    end
  end

  describe '#resource_class' do
    it 'returns the model class for the resource' do
      controller_path = 'admin/articles'
      resource_resolver = ResourceResolver.new(controller_path)
      assert_equal Article, resource_resolver.resource_class
    end
  end

  describe '#namespace' do
    it 'returns the namespace of the resource' do
      controller_path = 'admin/articles'
      resource_resolver = ResourceResolver.new(controller_path)
      assert_equal 'admin', resource_resolver.namespace
    end
  end

  describe '#dashboard' do
    it 'returns the dashboard for the resource' do
      controller_path = 'admin/articles'
      resource_resolver = ResourceResolver.new(controller_path)
      assert_equal  ArticleDashboard, resource_resolver.dashboard
    end
  end
end
