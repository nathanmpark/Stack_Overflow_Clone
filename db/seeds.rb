require 'Faker'


20.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password_hash: "password")
end

100.times do
  Question.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: rand(1..20))
end

100.times do
  Answer.create(content: Faker::Lorem.sentence, question_id: rand(1..100), user_id: rand(1..20))
end

100.times do
   Comment.create(content: Faker::Lorem.paragraph, question_id: rand(1..100), user_id: rand(1..20))
end

100.times do
   Comment.create(content: Faker::Lorem.paragraph, answer_id: rand(1..100), user_id: rand(1..20))
end

vote_type = [true,false]

1000.times do
  Vote.create(upvote:vote_type.sample, question_id:rand(1..100), user_id: rand(1..20))
end
1000.times do
  Vote.create(upvote:vote_type.sample, answer_id:rand(1..100), user_id: rand(1..20))
end
1000.times do
  Vote.create(upvote:vote_type.sample, comment_id:rand(1..100), user_id: rand(1..20))
end

