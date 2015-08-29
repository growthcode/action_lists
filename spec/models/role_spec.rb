# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  doer       :string           not null
#  specific   :boolean          default(FALSE)
#  title      :string
#  full_name  :string
#  email      :string
#  plan_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Role, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
