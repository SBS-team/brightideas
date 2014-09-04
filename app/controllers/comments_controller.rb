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

  private
  def comment_params
    params.require(:comment).permit(:text, :idea_id)
  end
end