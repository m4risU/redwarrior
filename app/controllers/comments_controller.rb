class CommentsController < ApplicationController
  before_filter :fetch_post
  layout "posts"

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(params[:comment])

    if @comment.save
      redirect_to post_path(@post), :notice => "Commented!"
    else
      render "new"
    end
  end

  private
  def fetch_post
    @post = Post.find(params[:post_id])
  end
end
