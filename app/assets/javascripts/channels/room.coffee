App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.message.blank?
      $('.messages_room').append data.message
      $('textarea[placeholder="write your message"]').val ''
      scroll_bottom()


$(document).on 'turbolinks:load', ->
  scroll_bottom()


scroll_bottom = () ->
  $('.messages_room').scrollTop($('.messages_room')[0].scrollHeight)
