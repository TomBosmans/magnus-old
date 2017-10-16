# == Schema Information
#
# Table name: groups
#
#  id            :integer          not null, primary key
#  group_item_id :integer
#  name          :string
#  description   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_groups_on_group_item_id  (group_item_id)
#

require 'test_helper'

describe Group do
  # For the test we are using a variable named library
  # That is a group with the name books.
  let(:library) { FactoryGirl.create(:group, name: :books) }
  let(:library_group) { FactoryGirl.create(:group, name: :libraries) }
  
  describe '#name' do
    it 'responds to name' do
      assert library.respond_to? :name
    end
  end

  describe '#description' do
    it 'responds to description' do
      assert library.respond_to? :description
    end
  end

  describe '#items' do
    it 'responds to items' do
      assert library.respond_to? :items
    end
  end

  describe '#items_alias' do
    it 'responds to items_alias' do
      assert library.respond_to? :items_alias
    end
  end

  describe '#group_items' do
    it 'responds to group_items' do
      assert library.respond_to? :group_items
    end
  end

  describe '#books' do
    it 'responds to books' do
      assert library.respond_to? :books
    end

    it 'does not respond to a random name' do
      assert_not library.respond_to? :articles
    end

    it 'returns the same as items' do
      4.times { library_group.group_items.create }
      assert library.items == library.books
    end
  end
end
