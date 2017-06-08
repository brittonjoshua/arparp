get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions' do
  @question = Question.new(title: params[:title], text: params[:text], creator: current_user)
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @questions = Question.all
    @errors = @question.errors.full_messages
    erb :'/questions/index'
  end
end
