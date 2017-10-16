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

FactoryGirl.define do
  factory :group do
    name 'items'
    description 'This is a default group'
  end
end
