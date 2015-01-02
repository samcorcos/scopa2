@GameFactory = {}

GameFactory.createGame = (playerIds) ->
  deck = createDeck()
  players = createPlayers(playerId)

createDeck = ->
  suits = ['Cups', 'Coins', 'Swords', 'Clubs']
  cards = []

  suits.forEach (suit) ->
    for i in [0..10] by 1
      name = i
      name = 'A' if i is 1
      name = 'N' if i is 8
      name = 'Q' if i is 9
      name = 'K' if i is 10
      cards.push
        suit: suit
        value: i
        name: name
    return
  _.shuffle(cards)
