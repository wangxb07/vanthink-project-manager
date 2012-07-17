class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.references :user
      t.references :project

      t.timestamps
    end
    add_index :followers, :user_id
    add_index :followers, :project_id
  end
end
