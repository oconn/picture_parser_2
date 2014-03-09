class UsersController < ApplicationController

	def show
    @user = current_user

    @picture = @user.pictures.first.to_json
	end


end
