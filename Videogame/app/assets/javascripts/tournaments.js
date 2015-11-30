// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('.ctrl-tournaments.actn-index').ready(tournamentsIndex)

$('[data-hook~=tourney-add]').on('click', showTournamentForm)
$('[data-hook~=tourney-form]').on('submit', createTournament)


$('.ctrl-tournaments.actn-index').on("click", '[data-hook="tourney-delete"]', destroyTournament)


$('.ctrl-tournaments.actn-index').on("click", '[data-hook="player-add"]', showPlayerForm)


$('#js-player-form').on("submit", addPlayerToTournament);


