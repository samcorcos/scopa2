@Games = new Meteor.Collection 'games'

if Meteor.isServer
  Meteor.publish 'games', ->
    Games.find
      currentTurn: @userId

  Meteor.publish 'users', ->
    Meteor.users.find()

if Meteor.isClient
  Meteor.subscribe 'games'
  Meteor.subscribe 'users'

###

This is what one of our game records will look like:

games = {
  currentTurn = [],
  deck: [],
  table: [],
  players: {
    a: {
      hand: [],
      pile: [],
      score: {}
    },
    b: {}
  }
  inProgress: true/false,
  started: date,
  finished: date,
  winner: id
}

###
