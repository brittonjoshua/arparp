5.times do
  user = User.new(name: Faker::Name.name, password: "password")
  user.email = Faker::Internet.safe_email(user.name)
  user.save!
end

users = User.all



# may need to make some votes
# 22.times do
#   vote = Vote.new(voter: users.sample, value: [-1,0,1].sample)
# end



Question.create!(title: "Food?", text: "What do sea lions eat?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "How Tall?", text: "How tall do sea lions get?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Ear Flaps", text: "How many ear flaps do they have?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Color", text: "How many ear flaps do they have?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Noises so confused", text: "What noises do they make??", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Fav Time Of Year", text: "What's a sea lion's favorite time of the year?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Old Age??", text: "How old do they get?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Weight Per Feed", text: "What percentage of their body weight do they eat per feeding?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Average Weight", text: "How much do they weigh on average", best_answer_id: 1, creator: users.all.sample)

questions = Question.all


20.times do
  Answer.create!(text: ["arp ","ARP "].sample * (1..10).to_a.sample, question: questions.sample, responder: users.sample)
end

answers = Answer.all

15.times do
  comment = Comment.new(text: Faker::Hipster.sentence, commentor: users.all.sample)
  question = questions.sample
  question.comments << comment
  comment.save!
end

10.times do
  comment = Comment.new(text: Faker::Hipster.sentence, commentor: users.all.sample)
  answer = answers.sample
  answer.comments << comment
  comment.save!
end




















