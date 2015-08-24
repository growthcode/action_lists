# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  deed        :string
#  description :text
#  role        :string
#  person      :string
#  priority    :integer
#  position    :integer
#  included    :boolean          default(FALSE)
#  inbox       :boolean          default(TRUE)
#  minutes     :integer
#  plan_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Task < ActiveRecord::Base
  has_many :needs, inverse_of: :task, dependent: :destroy
  belongs_to :plan, inverse_of: :tasks
end