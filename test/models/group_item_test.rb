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

class GroupItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
