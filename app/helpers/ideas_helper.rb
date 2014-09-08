module IdeasHelper
  def get_idea_avatar(idea)
    if !idea.avatar_id.nil?
      Attachment.find(idea.avatar_id).path.thumb_200x200.url
    else
      '/img/no_image_available_thumb.jpg'
    end
  end

  def get_idea_rating(idea)
    !idea.ratings.average(:rate).nil? ? idea.ratings.average(:rate).round(2): 0
  end
end
