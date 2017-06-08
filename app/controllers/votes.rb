# temp route on line 3

get '/' do
  erb :'questions/show'
end


# post 'questions/:question_id/votes' do
post 'questions/votes' do

  question = Question.find(parms[:question_id])
  uservote = question.votes.find(session[:user_id])
  @questions = Question.all
  # question.votes.create
  if params[:upvote]
    if uservote && uservote.value == 1
      @errors = ['Aaarp! you have already up voted for this :/']
      erb :'/questions/show'
    elsif uservote && uservote.value == -1
      uservote.update_attributes(value: 1)
      erb :'/questions/show'
    else
      vote = question.votes.create(user_id: session[:user_id], value: 1)
      erb :'/questions/show'
    end
  elsif params[:downvote]
    if uservote && uservote.value = -1
      @errors = ['Aarp! you can only down vote once fool!!']
      erb :'questions/show'
    elsif uservote && uservote.value = 1
      uservote.update_attributes(value: -1)
      erb :'questions/show'
    end
  end
end
