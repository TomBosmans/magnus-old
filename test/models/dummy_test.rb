# == Schema Information
#
# Table name: dummies
#
#  id         :integer          not null, primary key
#  position   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  text       :string
#

require 'test_helper'

class DummyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
