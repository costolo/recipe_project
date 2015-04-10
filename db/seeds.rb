harry = User.create(name: "Harry", password: "asdf")
chicken = Recipe.create(name: "chicken", ingredients: "chicken", instructions: "cook chicken", user_id: 1)
harrys_vote = Vote.create(user_id: 1, recipe_id: 1)
harrys_comment = Comment.create(user_id: 1, recipe_id: 1, content: "this recipe sux")
