module UsersHelper
  def last_user_activity(user) #FIXME move user model
    if !user.ideas.empty? && !user.comments.empty?
      latest_idea = user.ideas.sort_by{ |idea| idea.created_at }.last.created_at
      latest_comment = user.comments.sort_by{ |comment| comment.created_at }.last.created_at
      last_activity = latest_idea >= latest_comment ? latest_idea : latest_comment
      last_activity.to_datetime
    elsif user.ideas.empty? && user.comments.empty?
      last_activity = user.updated_at
    elsif !user.ideas.empty?
      last_activity = user.ideas.sort_by{ |idea| idea.created_at }.last.created_at
    elsif !user.comments.empty?
      last_activity = user.comments.sort_by{ |comment| comment.created_at }.last.created_at
    end
  end


  # def last #example
  #   activity = []
  #   activity << user.ideas.last
  #   activity << user.comments.last
  #
  #   activity.compact.sort_by do |obj|
  #     obj.updated_at
  #   end.last.try(:updated_at) || user.updated_at
  #
  # end
end
