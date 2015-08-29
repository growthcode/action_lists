class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string     :deed #=> the action statement
      t.text       :description  #=> the details
      t.integer    :priority
      t.integer    :position #=> for sorting dynamically
      t.boolean    :included, default: false
      t.boolean    :inbox, default: true
      t.integer    :minutes #=> task's average estimated minutes to complete

      t.belongs_to :plan
      t.belongs_to :role
      t.timestamps
    end
    add_index :tasks, :plan_id
    add_index :tasks, :position
    add_index :tasks, :priority
    add_index :tasks, :created_at
  end
end
