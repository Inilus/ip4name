class User < ActiveRecord::Base

  has_many :services
  has_many :links

#  attr_accessible :name, :email
end

