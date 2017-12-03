require 'test_helper'
require "#{Rails.root}/lib/dashboard/base"

describe Dashboard::Base do
 # Reset the base class after each test
 after(:each) do
    Dashboard.send(:remove_const, 'Base')
    load "lib/dashboard/base.rb"
  end

  describe '.attribute' do
    it 'sets attribute on the dashboard' do
      Dashboard::Base.attribute name: :string
      assert_equal :name, Dashboard::Base.attributes.first.name
    end

    it 'creates Dashboard::Attribute objects' do
      Dashboard::Base.attribute name: :string
      assert_equal Dashboard::Attribute, Dashboard::Base.attributes.first.class
    end

    it 'can take multiple attributes' do
      Dashboard::Base.attribute name: :string, age: :integer
      assert_equal 2, Dashboard::Base.attributes.count
    end
  end

  describe '.attributes' do
    it 'returns is an empty array by default' do
      assert_equal [], Dashboard::Base.attributes
    end
  end

  # Exact same behaviour is expected from all 4.
  [:show_page, :index_page, :edit_page, :new_page].each do |page|
    describe ".#{page}" do
      it "adds given attributes to #{page}_attributes" do
        Dashboard::Base.send(page, :name, :string)
        assert_equal 2, Dashboard::Base.send("#{page}_attributes").count
      end
    end

    describe ".#{page}_attributes" do
      it 'returns attributes if none are set' do
        Dashboard::Base.attribute name: :string, age: :integer
        assert_equal 2, Dashboard::Base.send("#{page}_attributes").count
      end

      it "returns #{page} attributes if assigned" do
        Dashboard::Base.attribute name: :string, age: :integer
        Dashboard::Base.send(page, :name)
        assert_equal 1, Dashboard::Base.send("#{page}_attributes").count
      end
    end
  end
end
