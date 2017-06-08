

post 'questions/:question_id/votes' do
  question = Question.find(parms[:question_id])
  uservote = question.votes.find(session[:user_id])
  @questions = Question.all

  if params[:upvote]
    if uservote && uservote.value == 1
      @errors = ['Aaarp! you have already up voted for this :/']
      erb :'questions/show'
    elsif uservote && uservote.value == -1
      uservote.update_attributes(value: 1)
      question.total_votes.to_s
      redirect "/questions/show"
    else
      vote = question.votes.create(user_id: session[:user_id], value: 1)
      question.total_votes.to_s
      redirect "/questions/index"
    end
  elsif params[:downvote]
    if uservote && uservote.value = -1
      @errors = ['Aarp! you can only down vote once fool!!']
      erb :'questions/show'
    elsif uservote && uservote.value = 1
      uservote.update_attributes(value: -1)
      question.total_votes.to_s
      redirect "/questions/show"
    else
      vote = question.votes.create(user_id: session[:user_id], value: 1)
      question.total_votes.to_s
      redirect "/questions/index"
    end
  end
end
