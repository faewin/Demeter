get '/' do
  redirect '/sessions/new'
end

#reinder sign-in page
get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  @valid_user = User.find_by(email: params[:email])
  if @valid_user != nil && @valid_user.password == params[:password]
    session[:user_id] = @valid_user.id
    redirect '/twits' #redirect to twit feed
  else
    redirect 'users/new'
  end
end

get '/users/new' do
  erb :sign_up_page
end

post '/users' do
  @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      redirect '/sessions/new' #redirect to twitter feed
    else
      redirect '/user/new'
    end
end

#logs out user clear session
get '/logout' do
  session.clear
  redirect '/sessions/new'
end

# ********************************

get '/twits' do
  redirect 'users/new' unless session[:user_id]

  @all_twits = Twit.all
  @all_users = User.all
  erb :twits_feed
end

post '/twits' do
  twit = Twit.new(message: params[:message], user_id: session[:user_id])
  if twit.save
    redirect '/twits'
  else
    flash[:error] = "Message needs to be less than 140 chars and more than 1 char"
    redirect '/twits'
  end
end

# ***********************************

get "/profile/:user_id" do
  @user_twits = Twit.where(user_id: params[:user_id])
  @user_info = User.find_by(id: params[:user_id])
  erb :profile_page
end

# ***********************************

post '/follow/:profile_id' do

  if Following.where(follower_id: session[:user_id] ,followed_id: params[:profile_id]) != []
    flash[:error] = "You're already are following this user"

    redirect "/profile/#{params[:profile_id]}"
  else
    Following.create(follower_id: session[:user_id] ,followed_id: params[:profile_id])
    redirect "/profile/#{params[:profile_id]}"
  end
end
