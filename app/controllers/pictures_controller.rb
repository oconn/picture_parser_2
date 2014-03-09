class PicturesController < ApplicationController

	def new
    @picture = Picture.new
	end

	def create
    @picture = Picture.new(picture_params)

    if @picture.save
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

	def picture_params
    params.require(:picture).permit(:picture_images)
	end
end
