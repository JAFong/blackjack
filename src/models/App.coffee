# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    if @get('playerHand').isBlackJack()
      @trigger('blackJack', @get 'playerHand')
    if @get('dealerHand').isBlackJack()
      @trigger('blackJack', @get 'dealerHand')

      # when does the game end?
      #
      # when user bust -> dealer automatically draws till end
      # when user blackjack -> dealer automatically draw till end
      # when user stand -> dealer automatically draws till end

