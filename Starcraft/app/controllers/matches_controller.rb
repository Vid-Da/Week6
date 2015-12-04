class MatchesController < ApplicationController

	def new
		@player = Player.new
	end

	def show
	
		@match = Match.find_by(id: params[:winner_id])
		@player = Player.find_by(id: params[:player_id])
	end

	def index
		@players = Player.all
		@player = Player.find_by(id: params[:id])
		@matches = Match.all
	end

end
