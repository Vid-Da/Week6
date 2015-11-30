function buildTourneyHtml (tournament) {
  return '\
    <li>\
   		<button class="btn btn-danger btn-xs" data-hook="tourney-delete" type="submit" name="tournament" value="'+  tournament.id + '"><span class="glyphicon glyphicon-trash"></span> Delete </button>\
   		<button class="btn btn-info btn-xs" data-hook="player-add" name="tournament" value="'+  tournament.id + '"> + player</button>\
     	<a href="/tournaments/' + tournament.id + '">' + tournament.name + '</a>\
    </li>\
 	'
 }
