class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :hearts, dependent: :destroy
  
  validates :user, presence: true
  validates :content, presence: true
  validates :date, presence: true
end