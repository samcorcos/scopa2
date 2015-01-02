otherId (game) ->
  game.currentTurn[(if game.currentTurn[0] is Meteor.userId() then 1 else 0)];

Template.gameList.helpers
    games: ->
      Games.find(inProgress: true).map (game) ->
        game.otherPlayer = Meteor.users.findOne(otherId(game)).username
        game.started = moment(game.started).fromNow()
        game

Template.userList.helpers
  users: ->
    myid = Meteor.userId()
    cantPlayAgainst = [myid]

    Games.find
      inProgress: true
    .forEach (game) -> cantPlayAgainst.push(otherId(game))
      return

    Meteor.users.find
      _id:
        $not:
          $in: cantPlayAgainst

Template.userItem.events
  'click button': (e,t) ->
    Meteor.call('createGame', t.data._id)
