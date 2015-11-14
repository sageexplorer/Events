class Event < ActiveRecord::Base
  validates :day, :time,  :place, :suggest, :user_id, :presence=>true

  #has_many :appearances
  #has_many :events, through: :appearances

end
