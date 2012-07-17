class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :total_work_hours
      t.integer :month_work_hours
      t.datetime :created
      t.datetime :modified
      t.integer :created_by
      t.integer :modified_by
      t.references :position

      t.timestamps
    end
    add_index :users, :position_id
  end
end
