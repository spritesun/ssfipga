module RequestsHelper
  def display_name(request, who)
    friendly_name = request.send("#{who}_friendly_name")
    user = request.send(who)
    current_user == user ? "#{user.username}(#{friendly_name})" : friendly_name
  end

  def display_name_by_id(request, user_id)
    user_id == request.sender_id ? display_name(request, :sender) : display_name(request, :receiver)
  end

  def display_unread_request(request)
    "unread" if request.messages.reject { |message| current_user.has_read? message }.length > 0
  end

  def display_unread_message(message)
    "unread" if !current_user.has_read? message, true
  end

end
