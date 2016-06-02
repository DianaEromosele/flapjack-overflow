User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all

User.create(username: "george", email: "george@gmail.com", password: "george")
User.create(username: "diana", email: "diana@gmail.com", password: "diana")
User.create(username: "chand", email: "chand@gmail.com", password: "chand")
User.create(username: "ted", email: "ted@gmail.com", password: "ted")


question_one = Question.create(title: "Chocolate chip pancakes?", body: "What are the ingredients for chocolate chip pancakes?", user_id: 1)

answer_one = Answer.create(body: "Flour, eggs, milk, chocolate chips. Good luck!", user_id: 2, question_id: 1)

Comment.create(body: "dark chocolate chips are the yummiest!", user_id: 3, commentable: question_one) 

Comment.create(body: "I like Ghirardelli chocolate chips", user_id: 4, commentable: question_one) 

Tag.create(name: "flapjacks")

QuestionTag.create(question_id: 1, tag_id: 1)

Tag.create(name: "chocolate")

QuestionTag.create(question_id: 1, tag_id: 2)

Tag.create(name: "ingredients")

QuestionTag.create(question_id: 1, tag_id: 3)




question_two = Question.create(title: "Blueberry Panckes", body: "What are the ingredients for blueberry pancakes?", user_id: 2)

answer_two = Answer.create(body: "Blueberries!", user_id: 4, question_id: 2)


Comment.create(body: "duh!", user_id: 1, commentable: question_two)

Comment.create(body: "They taste the best with fresh organic blueberries, though frozen works too", user_id: 3, commentable: question_two) 


QuestionTag.create(question_id: 2, tag_id: 1)

Tag.create(name: "blueberries")

QuestionTag.create(question_id: 2, tag_id: 4)

Tag.create(name: "ingredients")

QuestionTag.create(question_id: 2, tag_id: 5)




question_three = Question.create(title: "Turning over Pancakes", body: "How do I know when to turn my pancakes so they don't overook or burn?", user_id: 2)

answer_three = Answer.create(body: "Flip when you see holes forming on the top side of the pancake and the edges are golden.", user_id: 3, question_id: 3)

Comment.create(body: "The first one is usually a good way to test how long it takes", user_id: 1, commentable: question_three) 

Comment.create(body: "I really think it depends on the batter, how thick it is, etc.", user_id: 4, commentable: question_three) 


QuestionTag.create(question_id: 3, tag_id: 1)

Tag.create(name: "flipping")

QuestionTag.create(question_id: 3, tag_id: 6)

Tag.create(name: "cooktime")

QuestionTag.create(question_id: 3, tag_id: 7)



question_four = Question.create(title: "NYC Pancakes", body: "Where can I find the best pancakes in NYC?", user_id: 4)

answer_four = Answer.create(body: "Clinton Street Baking Company in the Lower East Side has the best pancakes in the city!", user_id: 3, question_id: 4)

Comment.create(body: "Oh please, Veselka is just as good without the crazy wait!", user_id: 2, commentable: question_four)

Comment.create(body: "No way, Clinton Street ftw!", user_id: 1, commentable: question_four) 


QuestionTag.create(question_id: 4, tag_id: 1)

Tag.create(name: "restaurants")

QuestionTag.create(question_id: 4, tag_id: 8)

Tag.create(name: "NYC")

QuestionTag.create(question_id: 4, tag_id: 9)



question_five = Question.create(title: "National Pancake Day", body: "When is national pancake day?", user_id: 3)

answer_five = Answer.create(body: "March 8th! Still gotta wait a few months :(", user_id: 2, question_id: 5)

Comment.create(body: "Everyday is pancake day!", user_id: 1, commentable: question_five) #


QuestionTag.create(question_id: 5, tag_id: 1)


question_six = Question.create(title: "Batter", body: "How long will pancake batter last while in the fridge?", user_id: 1)

answer_six = Answer.create(body: "Only 1-2 days.", user_id: 2, question_id: 6)

Comment.create(body: "Mine lasts about 3-4 days.", user_id: 4, commentable: question_six) 

Comment.create(body: "You can also freeze it to make it last longer", user_id: 3, commentable: question_six)

Comment.create(body: "Thanks everyone!", user_id: 1, commentable: question_six)  
 

QuestionTag.create(question_id: 6, tag_id: 1)

Tag.create(name: "batter")

QuestionTag.create(question_id: 6, tag_id: 10)



question_seven = Question.create(title: "Flapjack vs Pancake", body: "What's the difference between a flapjack and a pancake?", user_id: 1)

answer_seven = Answer.create(body: "They are the different names for the same thing", user_id: 2, question_id: 6)


Comment.create(body: "They're all delicious", user_id: 4, commentable: question_seven) 

Comment.create(body: "Flapjacks is what they call pancakes in 'Groundhog Day'. Great film.", user_id: 3, commentable: question_seven) 


QuestionTag.create(question_id: 7, tag_id: 1)

Tag.create(name: "colloquialisms")

QuestionTag.create(question_id: 7, tag_id: 11)



question_eight = Question.create(title: "Milk substitute", body: "I am lactose intolerant, can I substitute almond milk for milk in the recipe?", user_id: 3)

answer_eight = Answer.create(body: "Yes, you can substitute any non-dairy milk in your pancake recipe 1:1.", user_id: 2, question_id: 6)

Comment.create(body: "I like using coconut milk as a substitute, try it!", user_id: 4, commentable: question_eight) 


QuestionTag.create(question_id: 8, tag_id: 1)

Tag.create(name: "substitute")

QuestionTag.create(question_id: 8, tag_id: 12)

Tag.create(name: "milk")

QuestionTag.create(question_id: 8, tag_id: 13)







