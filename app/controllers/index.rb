
enable :sessions


get '/register' do
erb :register
end

post '/register' do
  User.create(user_name: params[:username], password_hash: params[:password])
    redirect '/'
end


get '/' do
  redirect '/fridge' if session[:user_id]
  erb:login
end


post '/login' do
  user = User.find_by(user_name: params[:username])

  if user.password_hash == params[:password]
    session[:user_id] = user.id
    redirect '/fridge'
  end
  "Invalid Login"
end


get '/logout' do
  session.delete :user_id
  redirect '/'
end

get '/fridge' do
  redirect '/' unless session[:user_id]
  erb :fridge
end