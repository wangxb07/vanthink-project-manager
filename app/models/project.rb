class Project < ActiveRecord::Base
  attr_accessible :created, :created_by, :deadline, :modified, :modified_by, :name, :remark, :total_work_hours, :followers_attributes
  validates :name, :presence => true,
                   :length => { :minimum => 2 }
  validates :deadline, :presence => true

  has_many :project_phases
  has_many :followers
  has_many :users, :through => :followers
  accepts_nested_attributes_for :followers, :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
