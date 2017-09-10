# == Schema Information
#
# Table name: maps
#
#  id         :integer          not null, primary key
#  name       :string
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Map < ApplicationRecord
  has_many :addresses
  alias_attribute :markers, :addresses

  accepts_nested_attributes_for :addresses, allow_destroy: true
end
