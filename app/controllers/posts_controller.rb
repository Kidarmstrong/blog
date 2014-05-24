class PostsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  def index
    @posts = Post.all
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      flash[:success] = 'Post created succesfully'
      redirect_to post_path(@post.id) 
    else
      render 'new'
    end
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render edit_post_path(@post.id)
    end
  end
  
  def show
    @post = Post.find_by_id(params[:id])
  end
  
  def edit
    @post = Post.find_by_id(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:subject, :main_body, :main_image, :main_image_cache)
  end

  def authenticate
    authenticate_or_request_with_http_basic do |name, password|
      name == 'admin' && password == 'password'
    end
  end
end
