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
#  logo_file_name            :string
#  logo_content_type         :string
#  logo_file_size            :integer
#  logo_updated_at           :datetime
#

class Setting < ApplicationRecord
  # Attributes
  has_attached_file :header_image
  has_attached_file :logo, styles: { large: "500x500", medium: "300x300", small: "100x100" }, default_url: "https://raw.githubusercontent.com/thoughtbot/empties/master/source/images/placeholder.png"

  # Validations
  validates :application_name, presence: true
  validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
end
