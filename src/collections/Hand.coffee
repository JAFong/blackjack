class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    # if @hasAce() and not @isDealer
    #   debugger;
    #   if array[0].get('value') + array[1].get('value') == 11
    #     console.log 'win'
    @clickedStand = false
    return

  hit: ->
    # if 2 aces (max = 22) -> 12
    # if 1 ace + 10JQK -> BlackJack ... WIN
    # if scores contain 21, yield that, otherwise u
    if not @clickedStand and not @isBlackJack()
      if _.max(@scores()) < 21 or _.min(@scores()) < 21
        @add(@deck.pop())

  stand: ->
     #
    if (not @isDealer)
      @clickedStand = true
    if (@isDealer and not @clickedStand)
      #
      @clickedStand = true
      @models[0].flip()
    while (@isDealer and _.min(@scores()) < 17 and _.max(@scores()) != 21)
      @add(@deck.pop())

  # if its one ace and max score = 21 -> blackjack || 2 cards and max score is 21

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  isBlackJack: ->
    if @hasAce() and _.max(@scores()) == 21 and this.models.length == 2
      return true
    return false
  ,

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


