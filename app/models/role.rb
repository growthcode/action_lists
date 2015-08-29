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

class Role < ActiveRecord::Base
  belongs_to :plan, inverse_of: :roles
  has_many :tasks, inverse_of: :role
end
