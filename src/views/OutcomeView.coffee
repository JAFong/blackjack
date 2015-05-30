class window.OutcomeView extends Backbone.View

  template: _.template 'Lose'

  initialize: ->
    console.log 'initialized'
    console.log @
        # @collection.on 'add remove change', => @render()
    console.log(@model)
    @model.get('playerHand').on 'playerLose', =>
      console.log 'I heard Busted'
      @render()
      return

  render: ->
    console.log 'trying to render busted'
    @$el.html(@template())
    # template: _.template '<h2><% if(userWon){ %>Dealer<% }else if{ %>You<% } %> (<span class="score"></span>)</h2>'

# if userWon, tie, dealerWon


# initialize
#   event listener for the 3 cases


# render
#   prepend to payerhandContainer
#   only render once game end
