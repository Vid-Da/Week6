
function tournamentsIndex () {
  var $tourneySection = $('.js-tourney-section')
  $tourneySection.empty()

  var request = $.get('/api/tournaments.json')
  request.fail(showError)
  request.done(showTournaments)

  function showError (error) {
    console.error('Error fetching tournament list.', '\n' + error.responseText)
    var message = 'There was a problem fetching the list of tournaments.'
    $tourneySection.append(buildErrorHtml(message))
  }

  function showTournaments (tournaments) {
    var html
    if (tournaments.length === 0) {
      html = buildErrorHtml('Looks like there aren\'t any tournaments yet.')
    } else {
      html = buildTourneyListHtml(tournaments)
    }

    $tourneySection.append(html)

    $('[data-hook~=tourney-add]').removeClass('hidden')
  }
}

// Functions below were added to manage the game. they could be on other files 

function destroyTournament (event) {
  event.preventDefault();
  var current_tournament = $(event.currentTarget);

  $.ajax ({
    url: '/api/tournaments/' + current_tournament.val(),
    type: 'DELETE',
    success: function() {
      tournamentsIndex();
    }
  })
}

function showPlayerForm (event) {
  var tourneyId = $(event.currentTarget).val();

  $.ajax ({
    url: '/api/players/',
    success: function (data) {
      $('#js-players').empty();
      data.forEach(function(player) {
        $('#js-players').append('<option data-tournament="' + tourneyId + '" value="' + player.id + '">' + player.name + '</option>');
      });
      $('#js-player-modal').modal('show')
    }
  });
}

function addPlayerToTournament (event) {
  event.preventDefault();

  var tournamentId = $(event.currentTarget).find('option:selected').data('tournament');
  var playerId = $('#js-players').val()

  $.ajax ({
    url: '/api/tournaments/' + tournamentId + '/player',
    type: 'POST',
    data: {player_id: playerId},
    success: function() {
      $('#js-player-modal').modal('hide');
    },
    error:{}
  });
}
