# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  name       :string
#  info       :string
#  latitude   :float
#  longitude  :float
#  map_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_addresses_on_map_id  (map_id)
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end