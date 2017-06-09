post '/questions/:id/comments' do
  authenticate!
  @question = Question.find(params[:id])
  @comment = @question.comments.new(text: params[:text], commentor: current_user)
  if @comment.save
    if request.xhr?
      erb :'questions/_new_question_comment', locals: {comment: @comment, question: @question}, layout: false
    else
      redirect "/questions/#{@question.id}"
    end
  else
    @errors = @comment.errors.full_messages
    erb :'/questions/show'
  end
end
