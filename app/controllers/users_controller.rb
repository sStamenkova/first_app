class UsersController < ApplicationController
	before_action :admin_user, only: [:index, :destroy]

	def show
		@user = User.find_by(id: params[:id])
		@products = @user.products
		@product = current_user.products.build
	end

	def index
		@users = User.paginate(page: params[:page])
	end

	def destroy
		User.find_by(id: params[:id]).destroy
		redirect_to request.referrer
	end

	private

	def admin_user
		redirect_to root_url unless current_user.admin?
	end
end
