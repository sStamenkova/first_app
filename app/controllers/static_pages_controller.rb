class StaticPagesController < ApplicationController

	def index
		if params[:search]
		@feed_items = Product.search(params[:search]).paginate(page: params[:page])
		else
		@feed_items = Product.all.paginate(page: params[:page])
		end
	end

end
