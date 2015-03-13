# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  this       :string(255)
#  that       :string(255)
#  postTime   :datetime
#  lat        :float
#  long       :float
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
