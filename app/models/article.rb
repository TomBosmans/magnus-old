# == Schema Information
#
# Table name: articles
#
#  id                     :integer          not null, primary key
#  created_by_id          :integer
#  group_item_id          :integer
#  name                   :string
#  description            :string
#  thumbnail_file_name    :string
#  thumbnail_content_type :string
#  thumbnail_file_size    :integer
#  thumbnail_updated_at   :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_articles_on_created_by_id  (created_by_id)
#  index_articles_on_group_item_id  (group_item_id)
#

class Article < ApplicationRecord
  include Groupable
end
