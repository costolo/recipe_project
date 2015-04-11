def vote_exists?(user, recipe)
  Vote.find_by("user_id = #{user.id} AND recipe_id = #{recipe.id}") ? true : false
end
