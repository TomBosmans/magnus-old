# == Schema Information
#
# Table name: settings
#
#  id               :integer          not null, primary key
#  application_name :string           default("Magnus"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
