# -*- coding: utf-8 -*-
STATUS_NEW = 1
STATUS_DEVEL = 2
STATUS_TEST = 3
STATUS_DONE = 4

# TODO
# 更新和删除的时候没有同时更新，相关数据的总工作时间
class WorkOrder < ActiveRecord::Base
  belongs_to :project_phase
  belongs_to :project
  belongs_to :user
  belongs_to :follower

  attr_accessible :content, :created, :remark, :status, :work_hours,
                  :project_phase_id, :project_id, :user_id, :follower_id
  validates :content, :created, :work_hours, :project_phase_id, :user_id, :presence => true

  before_save do |work_order|
    if work_order.respond_to? "status" \
      or work_order.status.nil \
      or work_order.status.empty \
      or [STATUS_, STATUS_DEVEL, STATUS_TEST, STATUS_DONE].find_index(work_order.status).nil
      work_order.status = STATUS_NEW
    end
    work_order.project_id = ProjectPhase.find(work_order.project_phase_id).project_id
    work_order.follower_id = Follower.where('project_id=? and user_id=?', work_order.project_id, work_order.user_id).first.id
  end

  after_update do |work_order|
    if work_order.status == STATUS_DONE
      add_associated_data_work_hours(work_order)
    end
  end

  after_destroy do |work_order|
    if work_order.status == STATUS_DONE
      sub_associated_data_work_hours(work_order)
    end
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
    work_hours = work_order.work_hours
    work_order.project_phase.total_work_hours -= work_hours
    work_order.project.total_work_hours -= work_hours
    work_order.user.total_work_hours -= work_hours
    work_order.follower.work_hours -= work_hours

    work_order.project_phase.save
    work_order.project.save
    work_order.user.save
    work_order.follower.save
  end
end
