module IdeasHelper
  def get_idea_avatar(idea)
    if !idea.avatar_id.nil?
      Attachment.find(idea.avatar_id).path.thumb_200x200.url
    else
      'no_image_available_thumb.jpg'
    end
  end

end
