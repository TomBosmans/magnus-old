# frozen_string_literal: true
# == Schema Information
#
# Table name: articles
#
#  id                     :integer          not null, primary key
#  title                  :string
#  description            :string
#  thumbnail_file_name    :string
#  thumbnail_content_type :string
#  thumbnail_file_size    :integer
#  thumbnail_updated_at   :datetime
#  content                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class Article < ApplicationRecord
  include Groupable

  has_attached_file :thumbnail, styles: { large: '600x600', medium: '200x200', small: '75x75' }
  validates_attachment_content_type :thumbnail, content_type: %r{\Aimage/.*\z}
end
