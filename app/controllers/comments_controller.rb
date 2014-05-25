class CommentsController < ApplicationController
  skip_before_filter :authenticate, only: :create

  def create
    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    flash[:success] = 'Thanks for your comment. It is currently pending approval'
    redirect_to @post
  end

  def index
    @comments_to_approve = Comment.where(approved: false)
    @comments = Comment.all
  end

  def update
    @comment = Comment.find_by_id(params[:id])
    @comment.update!(comment_update_params)
    redirect_to comments_path
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    @comment.destroy
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

  def comment_update_params
    params.require(:comment).permit(:author, :body, :approved)
  end
end
