class WorkOrder < ActiveRecord::Base
  belongs_to :project_phase
  belongs_to :project
  belongs_to :user
  belongs_to :follower

  attr_accessible :content, :created, :remark, :status, :work_hours, :project_phase_id, :project_id, :user_id, :follower_id
  validates :content, :created, :work_hours, :project_phase_id, :presence => true

  after_save do |work_order|
    add_associated_data_work_hours(work_order)
  end

  def add_associated_data_work_hours(work_order)
    work_hours = work_order.work_hours
    work_order.project_phase.total_work_hours += work_hours
    work_order.project.total_work_hours += work_hours
    work_order.user.total_work_hours += work_hours
    work_order.follower.work_hours += work_hours
    work_order.project_phase.save
    work_order.project.save
    work_order.user.save
    work_order.follower.save
  end

  def sub_associated_data_work_hours(work_order)

  end
end
