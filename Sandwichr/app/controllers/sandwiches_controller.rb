class SandwichesController < ApplicationController

	def index
		sandwiches = Sandwich.all
		render({json: sandwiches})
	end

	def create
		sandwich = Sandwich.create(sandwich_params)
		render status: 201, json: sandwich
	end

	def show
		sandwich = Sandwich.find_by(id: params[:id])
		if sandwich
			render status: 200, json: sandwich
		else 
			render status: 404, json: {error: "Sandwich not found"}
		end
	end

	def update
		sandwich = Sandwich.find_by(id: params[:id])
		unless sandwich
			render json: {error: "sandwich not found"}
			status: 404
			return
		end
		sandwich.update
		render json: sandwich
	end

		#version alternativa

	#def update
		#if sandwich
			#	if sandwich.update(sandwich_params)
				#		render json: sandwich
			#	else
				#		render status: :bad_request, json: {error: "Sandwich not updated"}
			#	end
		#else
			#	render status: 404, json: []
		#end
	#end

	def destroy
		sandwich = Sandwich.find_by(id: params[:id])
		unless sandwich
			render json: {error: "sandwich not found"}
			status: 404
			return
		end
		sandwich.destroy
	end


	private
	def sandwich_params
		params.require(:sandwich).permit(:name, :bread_type)
	end
end
