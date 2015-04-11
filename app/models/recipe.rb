class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :comments

  before_create :set_vote_count

  def set_vote_count
    self.vote_count = 0
  end

  def ingredients_array
  	self.ingredients.split(" ")
  end

  def upvote
    new_count = self.vote_count + 1
    self.update(vote_count: new_count)
    self.save
  end

  def downvote
    new_count = self.vote_count - 1
    self.update(vote_count: new_count)
  end
end
