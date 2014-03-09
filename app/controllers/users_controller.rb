class UsersController < ApplicationController

	def show
    @user = current_user

    @picture = {path: @user.pictures.first.path,
                longitude: @user.pictures.first.longitude,
                latitude: @user.pictures.first.latitude}.to_json

    
	end


  def pictures 
    @picture = {path: current_user.pictures.first.path,
                longitude: current_user.pictures.first.longitude,
                latitude: current_user.pictures.first.latitude}
    # binding.pry
    render :json => @picture
  end


end
