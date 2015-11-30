class TournamentsController < ApplicationController
  
  def index
  	tournaments = Tournament.all
    
    respond_to do |format|
    	format.html
    	format.json {render json: tournaments}
    end
  end


  def create
  	new_tournament = Tournament.create(tournaments_params)
  	render status: 201, json: new_tournament
  end


  def destroy
  	tournament_to_destroy = Tournament.find_by(id: params[:id])
  	
  	if tournament_to_destroy.delete
  		render status: :no_content, json: []
  	else
  		render status: :not_found, json: {errors: tournament_to_destroy.errors.full_messages}
  	end
  end


  def add_player
  	tournament = Tournament.find_by(id: params[:id])
  	player = Player.find_by(id: params[:player_id])
  	tournament.players.push(player)
  	render status: 201, json: tournament
  end


  private

	def tournaments_params
		params.require(:tournament).permit(:name)
	end

end
