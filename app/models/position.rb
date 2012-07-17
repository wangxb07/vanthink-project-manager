class Position < ActiveRecord::Base
  attr_accessible :created, :created_by, :modified, :modified_by, :name, :remark
  validates :name, :presence => true,
                    :length => { :minimum => 2 }
end
