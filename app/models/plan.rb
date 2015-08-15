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

class Plan < ActiveRecord::Base
  has_many :tasks, inverse_of: :plan, dependent: :destroy
  has_many :needs, through: :tasks
  belongs_to :user, inverse_of: :plans
end
