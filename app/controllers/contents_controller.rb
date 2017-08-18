class ContentsController < ApplicationController
load_and_authorize_resource 

  def index
  
  
    @district = Category.all
    @type = Type.all
    
    @query_district = params[:input_district]
    @query_type = params[:input_type]
    
    if !@query_district && !@query_type
      @result = []
    elsif @query_district
      @result = Post.joins(:category).merge(Category.where(name: @query_district))
    elsif @query_type
      @result = Post.joins(:type).merge(Type.where(name: @query_type))
    end     
        
    @posts = Post.all
    @posts_1=@posts.where(category_id:1)
    @posts_2=@posts.where(category_id:2)
    @posts_3=@posts.where(category_id:3)
    @posts_4=@posts.where(category_id:4)
    @posts_5=@posts.where(category_id:5)
    @posts_6=@posts.where(category_id:6)
    @posts_7=@posts.where(category_id:7)
    @posts_8=@posts.where(category_id:8)
    @posts_9=@posts.where(category_id:9)
    @posts_10=@posts.where(category_id:10)
    @posts_11=@posts.where(category_id:11)
    @posts_12=@posts.where(category_id:12)
    @posts_13=@posts.where(category_id:13)
    @posts_14=@posts.where(category_id:14)
    @posts_15=@posts.where(category_id:15)
    @posts_16=@posts.where(category_id:16)
    @posts_17=@posts.where(category_id:17)
    @posts_18=@posts.where(category_id:18)
    @posts_19=@posts.where(category_id:19)
    @posts_20=@posts.where(category_id:20)
    @posts_21=@posts.where(category_id:21)
    @posts_22=@posts.where(category_id:22)
    @posts_23=@posts.where(category_id:23)
    @posts_24=@posts.where(category_id:24)
    @posts_25=@posts.where(category_id:25)
    
    @posts_health=@posts.where(type_id:1)
    @posts_yoga=@posts.where(type_id:2)
    @posts_swim=@posts.where(type_id:3)
    @posts_gym=@posts.where(type_id:4)
    @posts_etc=@posts.where(type_id:5)
    
    @posts = Post.search(params[:search])
    @categories=Category.all
    
    @comments = Comment.new
    
  end
  
   def show
    @post=Post.find(params[:id])
    @categories=Category.all
    
    @comments = Comment.new
  end
  
  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end
  
end
