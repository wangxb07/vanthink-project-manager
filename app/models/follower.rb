class Follower < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :user_id, :project_id
  # attr_accessible :title, :body
end
