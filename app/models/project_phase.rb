class ProjectPhase < ActiveRecord::Base
  belongs_to :project
  attr_accessible :deadline, :name, :project_id
  validates :name, :presence => true,
                   :length => { :minimum => 2 }
  validates :deadline, :project_id, :presence => true
end
