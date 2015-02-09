helpers do
def current_user
    @user ||= User.find(session[:user_id])
    return @user
  end
end

#do i really need the helpers do?