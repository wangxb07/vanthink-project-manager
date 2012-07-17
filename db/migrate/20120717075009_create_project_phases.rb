class CreateProjectPhases < ActiveRecord::Migration
  def change
    create_table :project_phases do |t|
      t.string :name
      t.datetime :deadline
      t.references :project

      t.timestamps
    end
    add_index :project_phases, :project_id
  end
end
