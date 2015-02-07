
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


post '/new/note' do
  Note.create(description: params[:description])
  redirect "/fridge"
end


get '/note/:id/edit' do
  @note = Note.find(params[:id])
  erb :edit_note
end

put '/note/:id/edit' do
  @note= Note.find(params[:id])
  @note.update_attributes(description: params[:description])
  redirect "/fridge"
end

get '/note/:id/delete' do
  @note = Note.find(params[:id])
  erb :delete_note
end

delete '/note/:id/delete' do
    Note.find(params[:id]).destroy
    redirect '/fridge'
end


get '/logout' do
  session.delete :user_id
  redirect '/'
end

get '/fridge' do
  redirect '/' unless session[:user_id]
  @note= Note.all
  erb :fridge
end