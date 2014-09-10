module UsersHelper
  def last_user_activity(user)
    latest_idea = user.ideas.sort_by{ |idea| idea.created_at }.last.created_at
    latest_comment = user.comments.sort_by{ |comment| comment.created_at }.last.created_at
    last_activity = latest_idea >= latest_comment ? latest_idea : latest_comment
    last_activity.to_datetime
  end
end
