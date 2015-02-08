
def current_user
  @user ||= User.find(session[:user_id])
  return @user
end