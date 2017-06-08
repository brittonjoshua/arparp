post '/answers' do
  answer = Answer.new(params)
  answer.question.id =
  if answer.save
    redirect "/questions/#{ answer.question.id }"
  else
    status 422
    @errors= answer.errors.full_messages
    erb :'questions/show'
  end
end

put '/answers/:id' do
  answer = Answer.find(params[:id])
  question = answer.question
  # question.best_answer_id = answer.id
  question.update_attribute("best_answer_id", answer.id)
  redirect "/questions/#{question.id}"
end
