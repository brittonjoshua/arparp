get '/sessions/new' do
  # login once registered
  @user = User.new
  if request.xhr?
    erb :'/sessions/_new', locals: { user: @user }, layout: false
  else
    erb :'/sessions/new'
  end
end

post '/sessions' do
  # signin make new
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    # if request.xhr?
    #   channels = Channel.all
    #   erb :_show_all_all, locals: { channels: channels }, layout: false
    # else
    redirect '/'
      # redirect "/users/#{@user.id}"
    # end
  else
    @errors = ["Unfortunately, the system could not either find your email or verify your password."]
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  # logout
  session.delete(:user_id)
  redirect '/'
end
