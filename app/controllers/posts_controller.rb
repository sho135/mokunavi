class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    @posts = Post.all
  end

  def new_add
    @post = Post.find(params[:id])
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
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    # @post_images = @post.post_images
    # @post_images = PostImage.where(post_id: @post.id)
    @post_image = PostImage.new
    @post_comment = PostComment.new

  end

  def edit
    @post = Post.find(params[:id])
    @post_images = PostImage.where(post_id: @post.id)
    if @post.user == current_user
      render "edit"
    else
      redirect_to posts_path
    end
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
    redirect_to user_path
  end

  def search
    @user = current_user
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "index_search"
  end



  private

  def post_params
    params.require(:post).permit(:title, :body, post_images_attributes: [:image, :text])
  end

end
