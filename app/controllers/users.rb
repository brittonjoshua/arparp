get '/users/new' do
  # register form
  @user = User.new
  if request.xhr?
    erb :'/users/_new', locals: { user: @user }, layout: false
  else
    erb :'/users/new'
  end
end

post '/users' do
  # make new user
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
    # the redirect to a user idk
    # redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end
