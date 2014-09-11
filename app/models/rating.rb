class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea

  validates_presence_of :user_id, :idea_id

  after_save :update_rate


  private

  def update_rate
      idea.rate = !idea.ratings.average(:rate).nil? ? idea.ratings.average(:rate).round(2): 0
  end

end
