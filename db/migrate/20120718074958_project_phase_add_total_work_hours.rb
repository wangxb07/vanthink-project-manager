class ProjectPhaseAddTotalWorkHours < ActiveRecord::Migration
  def change
    add_column :project_phases, :total_work_hours, :integer
  end
end
