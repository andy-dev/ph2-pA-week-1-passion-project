enable :sessions


get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(user_name: params[:username])
  @user.password = params[:password]
  if @user.save
    session[:user_id] = @user.id
    redirect '/fridge'
  else
    @error = @user.errors[:user_name][0]
    # @user.errors
    # @errors = @user.errors
    # flash[:error] = "Error in creating the user."
    erb :register
  end
end


get '/' do
  redirect '/fridge' if session[:user_id]
  erb:login
end


post '/login' do
  user = User.find_by(user_name: params[:username])
  if user.password == params[:password] #https://github.com/codahale/bcrypt-ruby/blob/master/lib/bcrypt/password.rb
    session[:user_id] = user.id
    redirect '/fridge'
  else
    redirect '/'
   #@errors = user.errors
   #@error = @user.errors[:user_name][0]
  end

end


post '/new/note' do
  # user = User.find(session[:user_id])
  user = current_user
  Note.create(description: params[:description], user_id: user.id) if user != nil
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


get '/note/:id/seen' do
  @note = Note.find(params[:id])
  erb :seen_note
end

post '/note/:id/seen' do
  View.create(user_id: session[:user_id], note_id: params[:id])
  redirect '/fridge'
end


post '/note/:id/seen/by' do
  View.create(user_id: session[:user_id], note_id: params[:id])
  redirect '/fridge'
end


get '/logout' do
  session.delete :user_id
  redirect '/'
end

get '/fridge' do
  redirect '/' unless session[:user_id]
  @note= Note.all
  @user = User.find(session[:user_id])
  @views = View.all
  erb :fridge
end