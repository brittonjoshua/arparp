post '/questions/:id/comments' do
  @question = Question.find(params[:id])
  @comment = question.comments.new(text: params[:text], commentor: current_user)
  if @comment.save?

  else

    erb :'/questions/show'
  end
end

post '/questions/:id/answers/:answer_id/comments' do
  question = Question.find_by(id: params[:id])
  answer = Answer.find_by(id: params[:answer_id])
  answer.comments.new(text: params[:text], commentor: current_user)
  if answer.save
    redirect "/questions/#{question.id}"
  else
    erb :'/questions/show'
  end
end
