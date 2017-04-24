# == Schema Information
#
# Table name: settings
#
#  id               :integer          not null, primary key
#  application_name :string           default("Magnus"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Setting < ApplicationRecord
  # Validations
  validates :application_name, presence: true
end
