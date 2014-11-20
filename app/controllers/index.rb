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

# ********************************

get '/twits' do

  redirect 'users/new' unless session[:user_id]
  erb :twits_feed
end
