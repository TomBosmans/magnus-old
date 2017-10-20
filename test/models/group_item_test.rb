# == Schema Information
#
# Table name: group_items
#
#  id             :integer          not null, primary key
#  group_id       :integer
#  groupable_type :string
#  groupable_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_group_items_on_group_id                         (group_id)
#  index_group_items_on_groupable_type_and_groupable_id  (groupable_type,groupable_id)
#

require 'test_helper'

describe GroupItem do
  let(:group_item) { FactoryGirl.create(:group_item) }

  it 'is valid' do
    assert group_item.valid?
  end

  describe '#destroy' do
    it 'responds to destroy' do
      assert group_item.respond_to? :destroy
    end

    it 'destroys the group_item' do
      group_item.destroy
      assert group_item.destroyed?
    end

    it 'destroys the groupable' do
      group_item.destroy
      assert group_item.groupable.destroyed?
    end
  end

  describe '#group' do
    it 'responds to group' do
      assert group_item.respond_to? :group
    end

    it 'requires a group' do
      group_item.group = nil
      assert_not group_item.valid?
    end
  end

  describe '#groupable' do
    it 'responds to groupable' do
      assert group_item.respond_to? :groupable
    end

    it 'requires a groupable' do
      group_item.groupable = nil
      assert_not group_item.valid?
    end
  end
end
