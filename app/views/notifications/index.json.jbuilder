json.array! @notifications do |notification|
  json.id notification.id
  # json.recipient notification.recipient
  json.image notification.actor.image
  json.actor notification.actor.username
  json.action notification.action
  json.notifiable do
    json.type "your #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url story_path(notification.notifiable, anchor: dom_id(notification.notifiable))
end
