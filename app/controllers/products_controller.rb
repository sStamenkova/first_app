class ProductsController < ApplicationController

before_action :correct_user, only: [:destroy]


	def create
		@product = current_user.products.build(product_params)

		if @product.save
			flash[:success] = "New product added sucessfully!"
			redirect_to current_user
		else
			render 'static_pages/index'
		end
	end

	def destroy
		@product.destroy
		flash[:success] = "Product removed!"
		redirect_to current_user
	end

	private

	def product_params
		params.require(:product).permit(:title, :description)
	end

	def correct_user
		@product = current_user.products.find_by(id: params[:id])
		redirect_to root_url if @product.nil?
	end
end
