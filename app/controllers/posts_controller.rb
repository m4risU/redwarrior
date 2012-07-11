class PostsController < ApplicationController

  def index
    @posts = Post.all(:order => "created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments

    if request.path != post_path(@post)
      redirect_to @post, status: :moved_permanently
    end
  end

  def to_s
    @post.title
  end
end
