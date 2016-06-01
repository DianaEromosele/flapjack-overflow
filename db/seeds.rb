User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all

User.create(username: "gskrap", email: "gskrap@gmail.com", password: "test")

User.create(username: "tom", email: "tom@gmail.com", password: "test")
User.create(username: "diana", email: "diana@gmail.com", password: "diana")
User.create(username: "chand", email: "chand@gmail.com", password: "chand")
User.create(username: "ted", email: "ted@gmail.com", password: "ted")

q = Question.create(title: "How do you make chocolate chip pancakes?", body: "What are the ingredients?", user_id: 1)
Question.create(title: "Blueberry Panckes", body: "What are the ingredients for blueberry pancakes?", user_id: 1)
x = Question.create(title: "Turning over Pancakes", body: "How do I know when to turn?", user_id: 2)

a = Answer.create(body: "Flour, eggs, oil, chocolate chips. Good luck!", user_id: 1, question_id: 1)
b = Answer.create(body: "answer body", user_id: 2, question_id: 2)

Comment.create(body: "comment on question 1", user_id: 1, commentable: q)

Comment.create(body: "comment on question 2", user_id: 2, commentable: x)

Comment.create(body: "comment on answer 1", user_id: 1, commentable: a)

Comment.create(body: "comment on answer 2", user_id: 2, commentable: b)

Vote.create(user_id: 1, voteable: q)
Vote.create(user_id: 1, voteable: b)
Vote.create(user_id: 2, voteable: x)



