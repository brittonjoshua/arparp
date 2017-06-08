3.times do
  user = User.new(name: Faker::Name.name, password: "password")
  user.email = Faker::Internet.safe_email(user.name)
  user.save!
end

users = User.all

Question.create!(title: "Food?", text: "What do sea lions eat?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "How Tall?", text: "How tall do sea lions get?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Ear Flaps", text: "How many ear flaps do they have?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Color", text: "How many ear flaps do they have?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Noises so confused", text: "What noises do they make??", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Fav Time Of Year", text: "What's a sea lion's favorite time of the year?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Old Age??", text: "How old do they get?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Weight Per Feed", text: "What percentage of their body weight do they eat per feeding?", best_answer_id: 1, creator: users.all.sample)

Question.create!(title: "Average Weight", text: "How much do they weigh on average", best_answer_id: 1, creator: users.all.sample)



