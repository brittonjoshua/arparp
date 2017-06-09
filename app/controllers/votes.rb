

post 'questions/:question_id/votes' do
  authenticate!
  question = Question.find(parms[:question_id])
  uservote = question.votes.find_by(user_id: session[:user_id])
  @questions = Question.all

  if params[:upvote]
    if uservote && uservote.value == 1
      @error = ['Aaarp! you have already up voted for this :/']
      erb :'questions/show'
    elsif uservote && uservote.value == -1
      uservote.update_attributes(value: 1)
      question.total_votes.to_s
      redirect "/questions/show"
    else
      vote = question.votes.create(user_id: session[:user_id], value: 1)
      question.votes.total_votes.to_s
      redirect "/questions/index"
    end

  elsif params[:downvote]
    if uservote && uservote.value = -1
      @error = ['Aarp! you can only down vote once fool!!']
      erb :'questions/show'
    elsif uservote && uservote.value = 1
      uservote.update_attributes(value: -1)
      question.total_votes.to_s
      redirect "/questions/#{answer.question_id}"
    else
      vote = question.votes.create(user_id: session[:user_id], value: -1)
      question.total_votes.to_s
      redirect "/questions/index"
    end
  end
end

post '/answers/:id/votes' do
  authenticate!
  answer = Answer.find(params[:id])
  @question = Question.find_by(id: answer.question_id)
  if params[:upvote]
    @vote = Vote.new(voter_id: session[:user_id], value: 1)
    answer.votes << @vote
    if @vote.save
      redirect "/questions/#{@question.id}"
    else
      @errors = @vote.errors.full_messages
      erb :'questions/show'
    end
  elsif params[:downvote]
    @vote = Vote.new(voter_id: session[:user_id], value: -1)
    answer.votes << @vote
    if @vote.save
      redirect "/questions/#{@question.id}"
    else
      @errors = @vote.errors.full_messages
      erb :'questions/show'
    end
  end
end



# post '/answers/:answer_id/votes' do
#   authenticate!
#   answer = Answer.find_by(id: params[:answer_id])
#   uservote = answer.votes.find_by(voter_id: session[:user_id])
#   @question = Question.find_by(id: answer.question_id)
#   @answer = @question.answers

#   if params[:upvote]
#     if uservote && uservote.value == 1
#       @error = ['Aaarp! you have already up voted for this :/']
#       erb :'questions/show'
#     elsif uservote && uservote.value == -1
#       uservote.update_attributes(value: 1)
#       answer.total_votes.to_s
#       redirect "/questions/show"
#     else
#       vote = answer.votes.create(voter_id: session[:user_id], value: 1)
#       answer.total_votes
#       redirect "/questions/#{answer.question_id}"
#     end

#   elsif params[:downvote]
#     if uservote && uservote.value == -1
#       @error = ['Aarp! you can only down vote once fool!!']
#       erb :'questions/show'
#     elsif uservote && uservote.value == 1
#       uservote.update_attributes(value: -1)
#       answer.total_votes.to_s
#       redirect "/questions/#{answer.question_id}"
#     else
#       vote = answer.votes.create(voter: session[:user_id], value: -1)
#       answer.total_votes.to_s
#       redirect "/questions/#{answer.question_id}"
#     end
#   end
# end


post '/questions/:question_id/comments/:id/votes' do
  authenticate!
  comment = Comment.find(params[:id])
  @question = Question.find(params[:question_id])

  if params[:upvote]
    @vote = Vote.new(voter_id: session[:user_id], value: 1)
    comment.votes << @vote
    if @vote.save
      redirect "/questions/#{@question.id}"
    else
      @errors = @vote.errors.full_messages
      erb :'questions/show'
    end
  elsif params[:downvote]
    @vote = Vote.new(voter_id: session[:user_id], value: -1)
    comment.votes << @vote
    if @vote.save
      redirect "/questions/#{@question.id}"
    else
      @errors = @vote.errors.full_messages
      erb :'questions/show'
    end
  end
end


