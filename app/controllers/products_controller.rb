class ProductsController < ApplicationController

before_action :correct_user, only: [:destroy]


	def create
		@product = current_user.products.build(product_params)

		if @product.save
			redirect_to current_user
		else
			if @product.title == "" && @product.description == ""
				flash[:alert] = "Title and description can't be empty"
				redirect_to current_user
			elsif @product.description == ""
				flash[:alert] = "Description can't be empty"
				redirect_to current_user
			elsif @product.title == "" 
				flash[:alert] = "Title can't be empty"
				redirect_to current_user
			else
				redirect_to root_url
			end
		end
	end

	def destroy
		@product.destroy
		redirect_to request.referrer || root_url
	end

	private

	def product_params
		params.require(:product).permit(:title, :description, :image)
	end

	def correct_user
		@product = current_user.products.find_by(id: params[:id])
		redirect_to root_url if @product.nil?
	end
end
