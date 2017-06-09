get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answer = @question.answers
  erb :'/questions/show'
end

post '/questions' do
  authenticate!
  @question = Question.new(title: params[:title], text: params[:text], creator: current_user)
  if @question.save
     if request.xhr?
       erb :'/_show_questions', locals: {question: @question}, layout: false
     else
      redirect "/questions/#{@question.id}"
     end
  else
    @questions = Question.all
    @errors = @question.errors.full_messages
    erb :'/questions/index'
  end
end
