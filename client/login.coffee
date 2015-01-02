Template.signup.events
  'click button': (e,t) ->
    e.preventDefault()
    Accounts.createUser
      email: t.find('#su-email').value
      username: t.find('#su-username').value
      password: t.find('#su-password').value
    return

Template.login.events
  'click button': (e,t) ->
    e.preventDefault()
    Meteor.loginWithPassword(
      t.find('#li-username').value
      t.find('#li-password').value
    )
    return

Template.logout.events
  'click button': (e,t) ->
    e.preventDefault()
    Meteor.logout()
    return
