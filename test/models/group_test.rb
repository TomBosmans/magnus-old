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

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
