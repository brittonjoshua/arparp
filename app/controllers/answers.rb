post '/answers' do
  answer = Answer.new(params)
  @question = answer.question
  if @current_user
    if answer.save
        if request.xhr?
          erb :'questions/_answers', layout: false, locals: {question: @question, answer: answer}
        else
        redirect "/questions/#{ answer.question.id }"
        end
    else
      status 422
      @errors= answer.errors.full_messages
      erb :'questions/show'
    end
  else
    @errors = ['You must be logged in to post an answer.']
  end
end

put '/answers/:id' do
  answer = Answer.find(params[:id])
  question = answer.question
  # question.best_answer_id = answer.id
  question.update_attribute("best_answer_id", answer.id)
  redirect "/questions/#{question.id}"
end
