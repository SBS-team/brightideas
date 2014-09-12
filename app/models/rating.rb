class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea

  validates :user_id, :idea_id, presence: true
  validates :rate, numericality: {
      greater_than_or_equal_to: 0,
      less_than: 5
  }

  after_save :update_rate


  private

  def update_rate
      idea.rate = !idea.ratings.average(:rate).nil? ? idea.ratings.average(:rate).round(2): 0
  end

end
