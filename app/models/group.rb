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

class Group < ApplicationRecord
  include Groupable
  has_many :group_items

  def items
    group_items.map(&:groupable)
  end

  def items_alias
    name.downcase.gsub(/[^a-z]/, '') unless name.blank?
  end

  # library = Group.create(name: books); Book.create(group: group); library.books
  def method_missing(method, *args)
    return items if method.to_s == items_alias
    super
  end

  def respond_to?(method, include_private = false)
    method.to_s == items_alias ||
    super
  end

  def respond_to_missing?(method, include_private = false)
    method.to_s == items_alias ||
    super
  end
end
