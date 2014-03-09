class PicturesController < ApplicationController

	def new
    @picture = Picture.new
	end

	def create
    @picture = Picture.new(picture_params)
    puts picture_params
    if @picture.save
    	parse_picture(@picture.picture_image.url(:original, timestamp: false), @picture)
      redirect_to "/"
    else
      render "new"
    end
	end

	def show
    
	end

	def index
    @pictures = Pictures.all
	end

	def edit
    @picture = Picture.find(params[:id])
	end

	def update
    @picture = Picture.find(params[:id])
    @picture.update_attributes(picture_params)
	end

	def destroy

	end

	private

	def parse_picture(url, object)
		puts url
		puts object
	  # unless url[-4..-1] != ".JPG" && url[-4..-1] != ".jpg"
	  image_in_question = EXIFR::JPEG.new("#{Rails.root}/public/#{url}")

	  puts image_in_question

	  object.update_attributes(
	    latitude: image_in_question.gps.latitude, 
	    longitude: image_in_question.gps.longitude, 
	    date_time_original: image_in_question.date_time_original,
	    date_time: image_in_question.date_time,
	    gps_date_stamp: image_in_question.gps_date_stamp)

	end

	def picture_params
    params.require(:picture).permit(:picture_image)
	end
end
