post '/questions/:id/comments' do
  question = Question.find(params[:id])
  comment = question.comments.new(text: params[:text], commentor: current_user)

end
