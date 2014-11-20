get '/' do
  redirect '/sessions/new'
end

#reinder sign-in page
get '/sessions/new' do
  erb :sign_in
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
