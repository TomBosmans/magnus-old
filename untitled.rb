# app/models/concern/groupable.rb
module Groupable
  extend ActiveSupport::Concern

  included do
    has_one :group_item, as: :groupable
    has_one :group, through: :group_item

    scope :where_group, ->(group_id) { joins(:group_item).where(group_items: { group_id: id }) }
  end
end

# app/models/group.rb
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


# app/models/group_item.rb
class GroupItem < ApplicationRecord
  belongs_to :group
  belongs_to :groupable, polymorphic: true
end

# app/models/article.rb
class Article < ApplicationRecord
  include Groupable
end

# app/models/book.rb
class Book < ApplicationRecord
  include Groupable
  alias_attribute :library, :group
end
