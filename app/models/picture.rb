class Picture < ActiveRecord::Base
	
  # validates :longitude, presence: true
  # validates :latitude, presence: true

  has_attached_file :picture_image, :styles => { :original => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture_image, :content_type => /\Aimage\/.*\Z/
end
