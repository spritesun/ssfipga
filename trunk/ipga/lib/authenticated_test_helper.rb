module AuthenticatedTestHelper
  def login_as(user)
    session[:user_id] = user ? user.id : nil
  end

  def current_user
    user_id = session[:user_id]
    user_id ? User.find(user_id) : nil
  end
end