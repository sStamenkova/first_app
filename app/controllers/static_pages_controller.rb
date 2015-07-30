class StaticPagesController < ApplicationController

	def index
		if params[:search]
		@products = Product.search(params[:search]).paginate(page: params[:page])
		else
		@products = Product.all.paginate(page: params[:page])
		end
	end

end
