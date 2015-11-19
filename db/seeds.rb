# 10.times
# user = User.create(username: "This is the username of a user", email: "This is the email of a user with the password 'password' ", password_hash: BCrypt::Password.create("password"))
# do

# 10.times do
# answer = Answer.create(content: "This is the content of an answer")
# end

# 10.times do
# response = Response.new(content: "This is the content of a response")
# end

10.times do
question = Question.create(title: "This is the title of a question", content: "This is the content of a question")
end


