class User < ActiveRecord::Base
	
  attr_accessible :email, :name, :address
  validates :email,:presence => true,:uniqueness => true, :length => {:maximum => 120,:too_long => "Too long"}
  validates :name, :length => {:maximum => 20, :too_long => "Too long"}
  has_many :blogs
end
