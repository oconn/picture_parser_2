class Picture < ActiveRecord::Base
	
  validates :longitude, presence: true
  validates :latitude, presence: true
end
