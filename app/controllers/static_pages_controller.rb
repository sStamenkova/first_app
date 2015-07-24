class StaticPagesController < ApplicationController

	def index
		@feed_items = Product.all.paginate(page: params[:page])
	end

end
