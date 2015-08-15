class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string     :deed #=> the action statement
      t.text       :description  #=> the details
      t.string     :role #=> position / job title of person doing action
      t.string     :person
      t.integer    :priority
      t.integer    :position #=> for sorting dynamically
      t.boolean    :include
      t.integer    :minutes #=> task's average estimated minutes to complete

      t.belongs_to :plan
      t.timestamps
    end
    add_index :tasks, :plan_id
  end
end
