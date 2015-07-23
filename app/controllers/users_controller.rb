class UsersController < ApplicationController

	def show
		@user = User.find_by(id: params[:id])
		@products = @user.products
		@product = current_user.products.build
	end
end
