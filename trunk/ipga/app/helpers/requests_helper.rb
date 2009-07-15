module RequestsHelper
  def display_name(request, who)
    friendly_name = request.send("#{who}_friendly_name")
    user = request.send(who)
    current_user == user ? "#{user.username}(#{friendly_name})" : friendly_name
  end
end
