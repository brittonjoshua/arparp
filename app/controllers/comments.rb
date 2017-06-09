post '/questions/:id/comments' do
  authenticate!
  @question = Question.find(params[:id])
  @comment = @question.comments.new(text: params[:text], commentor: current_user)
  if @comment.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @comment.errors.full_messages
    erb :'/questions/show'
  end
end

