class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
      t.string :remark
      t.datetime :created
      t.datetime :modified
      t.integer :created_by
      t.integer :modified_by

      t.timestamps
    end
  end
end
