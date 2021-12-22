class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    @posts = Post.all
  end

  def new_add
    @post_new = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @user = current_user
    @posts = Post.all
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @post_comment = PostComment.new

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_path
  end

  def search
    @user = current_user
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "index_search"
  end



  private

  def post_params
    params.require(:post).permit(:title, :body, post_images_images: [])
  end

end
