# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Plan, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
