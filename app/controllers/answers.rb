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
