class PostsController < ApplicationController

  def new
  end

  def create
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
    params.require(:post).permit(:user_id, :title, :body, :image_id)
  end

end
