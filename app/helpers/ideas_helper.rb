module IdeasHelper
  def get_idea_avatar(idea)
    Attachment.find(idea.avatar_id).path.thumb_200x200.url
  end

  def get_idea_rating(idea)
    !idea.ratings.average(:rate).nil? ? idea.ratings.average(:rate).round(2): 0
  end
end
