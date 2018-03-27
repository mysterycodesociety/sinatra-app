class User < ActiveRecord::Base
    has_many :tweets
    
  validates :id, presence: true
  validates :name, presence: true
  validates :salutation, presence: true
  validates :email, presence: true
end