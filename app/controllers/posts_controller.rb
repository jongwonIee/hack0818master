class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    @posts_1=@posts.where(category_id:1)
    @posts_2=@posts.where(category_id:2)
    @posts_3=@posts.where(category_id:3)
    @posts_4=@posts.where(category_id:4)
    @posts_5=@posts.where(category_id:5)
    @posts_6=@posts.where(category_id:6)
    @posts_7=@posts.where(category_id:7)
    @posts_8=@posts.where(category_id:8)
    
    @posts = Post.search(params[:search])
    
  end

  def new
    @post = Post.new
    @categories=Category.all

  end

  def create
    post = Post.new(post_params)
    post.save

    redirect_to posts_path
  end

  def show
    @post=Post.find(params[:id])
  end
  
  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    @post.update(post_params)
    
    redirect_to @post
  end
  
   def destroy
    @post = Post.find(params[:id])
    @post.delete

    redirect_to posts_path
   end
    
  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end
end