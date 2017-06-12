get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  authenticate!
  @question = Question.new

  if request.xhr?
    erb :'/questions/_new_form', locals: { question: @question }, layout: false
  else
    redirect '/questions/new'
  end
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
       erb :'/_show_questions', locals: {question: @question }, layout: false
    else
      redirect "/questions/#{@question.id}"
    end
  else
    if request.xhr?
      @questions = Question.all
      @errors = @question.errors.full_messages
      erb :'/_errors', locals: { errors: @errors }, layout: false
    else
      redirect '/'
    end
  end
end


