# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()


      # when does the game end?
      #
      # when user bust -> dealer automatically draws till end
      # when user blackjack -> dealer automatically draw till end
      # when user stand -> dealer automatically draws till end
  events:
    'add remove update change .stand-button': ->
      if @get('playerHand').isBlackJack() and @get('dealerHand').isBlackJack()
        @trigger('tieGame')
      else if @get('playerHand').isBlackJack()
        @trigger('playerWin', @get 'playerHand')
      else if @get('dealerHand').isBlackJack()
        @trigger('playerLose', @get 'dealerHand')
      # @model.get('playerHand').scores()
      # @model.get('dealerHand').scores()
      return
    # 'click .stand-button': ->
    #   @model.get('dealerHand').stand()
    #   @model.get('playerHand').stand()
    #   return
