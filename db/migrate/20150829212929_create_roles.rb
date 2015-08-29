class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :doer, null: false
      t.boolean :specific, default: false
      t.string :title
      t.string :full_name
      t.string :email

      t.belongs_to :plan
      t.timestamps null: false
    end
    add_index :roles, :doer
    add_index :roles, :specific
  end
end
