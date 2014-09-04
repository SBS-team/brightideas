class CommentsController < ApplicationController
  def create
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
    else
      @comment = Comment.new(comment_params)
    end
    @comment.user_id = current_user.id
    @comment.save
    redirect_to :back

  end

  def comment_like
    @comment = Comment.find(params[:id])
    if @comment.votes_for.up.by_type(User).voters.include? current_user
      @comment.unliked_by current_user
    else
      @comment.liked_by current_user
    end
  end

  def comment_dislike
    @comment = Comment.find(params[:id])
    if @comment.votes_for.down.by_type(User).voters.include? current_user
      @comment.undisliked_by current_user
    else
      @comment.disliked_by current_user
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:text, :idea_id)
  end
end