class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.string :content
      t.string :remark
      t.integer :status
      t.integer :work_hours
      t.datetime :created
      t.references :project_phase
      t.references :user
      t.references :project
      t.references :follower

      t.timestamps
    end
    add_index :work_orders, :project_phase_id
    add_index :work_orders, :user_id
    add_index :work_orders, :project_id
    add_index :work_orders, :follower_id
  end
end
