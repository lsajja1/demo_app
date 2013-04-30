class Blog < ActiveRecord::Base
  attr_accessible :title, :content
  validates :title,presence: true, length: {maximum: 100,too_long: "title cannot be more than 100 characters"}
  validates :content, presence: true
  belongs_to :user
end
