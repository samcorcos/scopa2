@GameFactory = {}

GameFactory.createGame = (playerIds) ->
  deck = createDeck()
  players = createPlayers(playerIds)

  GameFactory.dealPlayers players, deck

  table = dealTable(deck)

  {
    deck: deck
    players: players
    table: table
    currentTurn: playerIds
    inProgress: true
    started: new Date()
  }

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

GameFactory.dealPlayers = (players, deck) ->
  for i in [0...3] by 1
    Object.keys(players).forEach (id) ->
      players[id].hand.push(deck.shift()) # remember, hand is the cards the current players has. This is saying "push to the current person's hand the current (shift) top card of the deck"
      return
  return

dealTable = (deck) ->
  c = deck.shift.bind(deck)
  [c(), c(), c(), c()]
