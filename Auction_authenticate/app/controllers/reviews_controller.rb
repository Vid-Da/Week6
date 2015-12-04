
class ReviewsController < ApplicationController
	before_action :authorize_user, only: [:create]

	def create
		description = params[:review][:description]

		user = User.find_by(id: params[:user_id])
		product = Product.find_by(id: params[:product_id])

		@review = product.reviews.new(user_id: user.id, description: description, product_id: product.id)

		if @review.save
			flash[:notice] = 'Review saved'
		else
			flash[:alert] = 'Sorry, something went wrong'
		end

		redirect_to(user_product_path(product.user_id, product))	
	end
end
