class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string      :resource
      t.text       :notes
      t.boolean    :complete
      t.integer    :position #=> for sorting dynamically

      t.belongs_to :task
      t.timestamps
    end
    add_index :needs, :task_id
  end
end
