# == Schema Information
#
# Table name: settings
#
#  id                        :integer          not null, primary key
#  application_name          :string           default("Magnus"), not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  header_image_file_name    :string
#  header_image_content_type :string
#  header_image_file_size    :integer
#  header_image_updated_at   :datetime
#

class Setting < ApplicationRecord
  # Attributes
  has_attached_file :header_image

  # Validations
  validates :application_name, presence: true
  validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\z/
end
