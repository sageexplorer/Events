class Event < ActiveRecord::Base
  validates :name, :day, :time, :place, :user_id, :presence=>true

  #has_many :appearances
  #has_many :events, through: :appearances

end
