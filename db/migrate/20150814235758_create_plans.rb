class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string      :name
      t.integer     :position #=> for sorting dynamically

      t.belongs_to  :user
      t.timestamps
    end
  add_index :plans, :user_id
  end
end
