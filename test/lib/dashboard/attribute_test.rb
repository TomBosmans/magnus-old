require 'test_helper'
require "#{Rails.root}/lib/dashboard/attribute"

describe Dashboard::Attribute do
  describe '#name' do
    it 'returns the attribute name' do
      attribute = Dashboard::Attribute.new(:name)
      assert_equal :name, attribute.name
    end
  end

  describe '#type' do
    it 'returns the type of the attribute' do
      attribute = Dashboard::Attribute.new(:age, type: :integer)
      assert_equal :integer, attribute.type
    end

    it 'has default value of :string' do
      attribute = Dashboard::Attribute.new(:title)
      assert_equal :string, attribute.type
    end
  end
end
