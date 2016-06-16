# Homepage (Root path)

helpers do 
  def current_user
    # find the current user by the session id
  end

  

  def is_logged_in?
    # returns true if user is logged in and false if not
  end

end


get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  erb :'songs/show'
end

post '/songs' do
  @song = Song.new(
    title:   params[:title],
    author: params[:author],
    url:  params[:url]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

  get '/login' do
    erb :'sessions/login'
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user and params[:password] == user.password
      redirect '/songs'
    else
      erb :'sessions/login'
    end
  end

  get '/signup' do
    @user = User.new
    erb :'sessions/signup'
  end

  post '/signup' do
    @user =  User.new(email: params[:email], password: params[:password])
    if @user.save
      redirect '/songs'
    else
      erb :'sessions/signup'
    end
  end

  get '/signout' do
    redirect '/'
  end


# get '/login' do
#   erb :'sessions/login'
# end

# post '/login' do
#   user = User.find_by(email: params[:email]) 
#   if !user.nil? and params[:password] == user.password
#     session[:user_id] = user.id
#     redirect '/'
#   else
#     # TODO: tell user that his email or password are incorrect
#     redirect '/login'
#   end
# end


# get '/signup' do
#   @user = User.new
#   erb :'sessions/signup'
# end

# post '/signup' do
#   @user = User.new(email: params[:email], password: params[:password]) 
#   if @user.save
#     session[:user_id] = user.id
#     redirect '/'
#   else
#     erb :'sessions/signup'
#   end
# end

# get '/signout' do
#   session.clear
#   redirect '/'
# end




