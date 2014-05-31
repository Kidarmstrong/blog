class PostsController < ApplicationController
  skip_before_filter :authenticate, :only => [:index, :show]

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
    params.require(:post).permit(:subject, :show_on_main_page, :main_article, :main_body, :caption, :main_image, :main_image_cache)
  end

end
