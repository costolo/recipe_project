class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :comments

  before_save :set_vote_count

  def set_vote_count
    self.vote_count = 0
  end
end
