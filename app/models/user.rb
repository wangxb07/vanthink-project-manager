class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  belongs_to :position
  attr_accessible :created, :created_by, :email, :modified, :modified_by, :month_work_hours, :name, :total_work_hours, :position_id
  validates :position_id, :presence => true, :allow_blank => false
  validates :name, :presence => true,
                   :length => { :minimum => 2 }
  validates :email, :presence => true,
                    :email => true

  has_many :followers
  has_many :projects, :through => :followers
end
