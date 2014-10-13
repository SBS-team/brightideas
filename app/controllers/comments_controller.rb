class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
    else
      @comment = Comment.new(comment_params)
    end
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = 'Your comment successfully added'
    else
      flash[:error] = 'Your comment not added'
    end
    redirect_to :back

  end

  def destroy
    comment  = Comment.find(params[:id])
    child_comments_ids = comment.descendants.pluck(:id)
    comment.children.destroy_all
    comment.destroy
    render json: {parent_comment_id: comment.id, child_comment_ids: child_comments_ids}
    #comment = Comment.find(params[:id])
    #comment.destroy
  end

  def comment_like
    @comment = Comment.find(params[:id])
    if @comment.votes_for.up.by_type(User).voters.include? current_user
      @comment.unliked_by current_user
    else
      @comment.liked_by current_user
    end
    render json: {result: "liked"}
  end

  def comment_dislike
    @comment = Comment.find(params[:id])
    if @comment.votes_for.down.by_type(User).voters.include? current_user
      @comment.undisliked_by current_user
    else
      @comment.disliked_by current_user
    end
    render json: {result: "disliked"}
  end


  private
  def comment_params
    params.require(:comment).permit(:text, :idea_id)
  end
end