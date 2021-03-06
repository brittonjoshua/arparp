# we'll always be logged in with authenticate helper
# need to do error handling in ajax with request.fail

get '/questions/:id/answers/new' do 
  authenticate!
  @question = Question.find(params[:id])

  if request.xhr?
    erb :'/answers/_new_form', locals: { question: @question }, layout: false 
  else 
    erb :'/answers/_new_form'
  end 
  
end 

post '/answers' do
  authenticate!
  @answer = Answer.new(params)
  @question = @answer.question
  if @answer.save
    if request.xhr?
      erb :'questions/_answers', layout: false, locals: {question: @question, answer: @answer}
    else
        redirect "/questions/#{@answer.question.id }"
    end
  else
    status 422
    @errors = @answer.errors.full_messages
    erb :'questions/show'
  end
end




put '/answers/:id' do
  authenticate!
  answer = Answer.find(params[:id])
  question = answer.question
  # question.best_answer_id = answer.id
  question.update_attribute("best_answer_id", answer.id)
  redirect "/questions/#{question.id}"
end
