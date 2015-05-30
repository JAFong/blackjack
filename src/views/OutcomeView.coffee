class window.OutcomeView extends Backbone.View

  template: _.template '
    <%if (this.playerLose) {%>
      Player Loses!
    <%}%>'
    # else if (tie)
    #   "Tie Game"
    # else
    #   "Player Wins!"
    # '

  playerLose: false
  tieGame: false
  playerWin: false

  initialize: =>
    @model.get('playerHand').on 'playerLose', =>
      console.log 'I heard Busted'
      @playerLose = true
      @render()
      return

  render: ->
    @$el.html(@template())



# template: _.template '<h2><% if(userWon){ %>Dealer<% }else if{ %>You<% } %> (<span class="score"></span>)</h2>'

# if userWon, tie, dealerWon


# initialize
#   event listener for the 3 cases


# render
#   prepend to payerhandContainer
#   only render once game end
