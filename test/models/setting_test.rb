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

require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
