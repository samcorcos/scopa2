Template.userList.helpers
  users: ->
    myid = Meteor.userId()
    cantPlayAgainst = [myid]

    Games.find
      inProgress: true
    .forEach (game) -> cantPlayAgainst.push(game.currentTurn[(if game.currentTurn[0] is myid then 0 else 1)])
      return

    Meteor.users.find
      _id:
        $not:
          $in: cantPlayAgainst

Template.userItem.events
  'click button': (e,t) ->
    Meteor.call('createGame', t.data._id)
