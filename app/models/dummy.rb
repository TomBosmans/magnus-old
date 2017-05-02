# == Schema Information
#
# Table name: dummies
#
#  id         :integer          not null, primary key
#  position   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  text       :string
#

class Dummy < ApplicationRecord
  default_scope { order("position ASC") }
end
