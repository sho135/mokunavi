class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to new_post_path
    else
      render :new
    end
  end

  def index
    @user = current_user
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def update
  end



  private

  def post_params
    params.require(:post).permit(:title, :body, post_images_images: [])
  end

end
