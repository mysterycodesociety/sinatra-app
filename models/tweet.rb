class Tweet < ActiveRecord::Base
  belongs_to :user
  
  validates :user, presence: true
  validates :content, presence: true
  validates :date, presence: true
end