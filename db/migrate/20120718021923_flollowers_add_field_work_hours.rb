class FlollowersAddFieldWorkHours < ActiveRecord::Migration
  def change
    add_column :followers, :work_hours, :integer
  end
end
