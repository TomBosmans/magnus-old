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

FactoryGirl.define do
  factory :article do
    title 'The fall of cadia'
    description 'Let it be known the planet broke before the guard'
    thumbnail_file_name 'fall_of_cadia.jpg'
    thumbnail_content_type 'image/jpeg'
    thumbnail_file_size 124
  end
end
