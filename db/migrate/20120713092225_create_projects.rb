class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :remark
      t.datetime :deadline
      t.integer :total_work_hours
      t.datetime :created
      t.datetime :modified
      t.integer :created_by
      t.integer :modified_by

      t.timestamps
    end
  end
end
