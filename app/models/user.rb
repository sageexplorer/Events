class User < ActiveRecord::Base
  has_secure_password  #AR method to activate bcrypt
  #has_many :appearances
  #has_many :events, through: :appearances
  #
  #
  #
  #attr_accessor :user_id
  validates_uniqueness_of :email

end
