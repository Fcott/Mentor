$(document).on "turbolinks:load", ->
  $("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      $(this).submit()

  $("#new_message").on "submit", (e) ->
    e.preventDefault()

    conversation_id = $("[data-behavior='message-form']").data("conversation-id")
    content = $("#message_content")

    App.room.send_message(conversation_id, content.val())

    content.val("")
