class User < ApplicationRecord
  has_secure_password
  
  validates :email, format: { :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :email, uniqueness: true
  validates :username, uniqueness: true 
  validates :password, :length => {
    :minimum => 6,
    :maximum => 10,
  }, :on => :create

  has_many :posts, dependent: :destroy
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

end
