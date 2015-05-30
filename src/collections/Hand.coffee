class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    @clickedStand = false
    @over21 = false
    return

  hit: ->
    if (_.min(@scores()) < 21 and not @clickedStand)
      @add(@deck.pop())
    if (_.min(@scores()) > 21)
      @over21 = true

  stand: ->
    if (not @isDealer)
      @clickedStand = true
    if (@isDealer and not @clickedStand)
      @clickedStand = true
      @models[0].flip()
    while (@isDealer and _.min(@scores()) < 17)
      @add(@deck.pop())

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


