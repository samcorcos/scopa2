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



###
