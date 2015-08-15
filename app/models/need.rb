# == Schema Information
#
# Table name: needs
#
#  id         :integer          not null, primary key
#  resource   :string
#  notes      :text
#  complete   :boolean
#  position   :integer
#  task_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Need < ActiveRecord::Base
  belongs_to :task, inverse_of: :needs
end
