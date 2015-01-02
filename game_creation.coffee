@GameFactory = {}

GameFactory.createGame = (playerIds) ->
  deck = createDeck()
  players = createPlayers(playerId)

  GameFactory.dealPlayers players, deck

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

createPlayers = (ids) ->
  o = {}
  ids.forEach (id) ->
    o[id]
      hand: []
      pile: []
      score:
        mostCoins: 0
        mostCards: 0
        setteBello: 0
        primera: 0
        scopa: 0
    return
  return 0
