# == Schema Information
#
# Table name: dummies
#
#  id         :integer          not null, primary key
#  position   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dummy < ApplicationRecord
  default_scope { order("position ASC") }
end
