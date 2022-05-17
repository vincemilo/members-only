class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
end
