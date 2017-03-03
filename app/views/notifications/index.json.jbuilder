json.array! @notifications do |notification|
  json.id notification.id
  json.unread !notification.read_at?
  json.template render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]

  # # json.recipient notification.recipient
  # json.image notification.actor.image
  # json.actor notification.actor.username
  # json.action notification.action
  # json.notifiable do
  #   json.type "your #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  # end
  # json.url story_path(notification.notifiable, anchor: dom_id(notification.notifiable))
end
