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

require 'test_helper'

describe Article do
  let(:article) { FactoryGirl.create(:article) }

  it 'is valid' do
    assert article.valid?
  end

  describe '#title' do
    it 'responds to title' do
      assert article.respond_to? :title
    end
  end

  describe '#description' do
    it 'responds to description' do
      assert article.respond_to? :description
    end
  end

  describe '#content' do
    it 'responds to content' do
      assert article.respond_to? :content
    end
  end

  # Should create shared test for all images/thumbnails
  describe '#thumbnail' do
    it 'responds to thumbnail' do
      assert article.respond_to? :thumbnail
    end

    it 'is valid if thumbnail type is an image' do
      article.thumbnail_content_type = 'image/jpeg'
      assert article.valid?
    end

    it 'is not valid if the thumbnail type is not an image' do
      article.thumbnail_content_type = 'application/pdf'
      assert_not article.valid?
    end
  end
end
