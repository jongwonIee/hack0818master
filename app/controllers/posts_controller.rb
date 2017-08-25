class PostsController < ApplicationController
  def index
    @posts = Post.all
    @categories = Category.all
    @types = Type.all
    @district = Category.all
  end

  def new
  #포스트 인덱스 게시판 글 보기 용   
    if params[:search]
      @posts = Post.search(params[:search])
    else
      @posts = Post.all
    end
    
    #포스트 뉴 글쓰기 용 
    @post = Post.new
    @categories = Category.all
    @types = Type.all
    
    
    #***여기부터 지도 관련
    @district = Category.all #구별 데이터 
    
    @query_district = params[:input_district] #드롭다운에서 사용자의 위치를 받는다. 
    
    if !@query_district #선택을 안하면 성균관대 위치
      @x = 37.584862
      @y = 126.997122
    else  #선택을 하면 그 지역을 center로 두고 보여준다. 
      @place = Category.where(name: @query_district)
      @x = @place.first.coorlat
      @y = @place.first.coorlong
    end
  
  
   # @db_columns = Post.column_names #원래 column네임 뽑아서 해주려 했으나 필요없는 짓. ㅣ
    @result = @posts #***** 추후 카테고리분류 필터 된 결과값으로 바꿔주어야 함! 
    @db_json = @result.as_json
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    
    post.lat = params[:lat] #지도에서 선택한 체육관 좌표를 같이 저장. 
    post.lng = params[:lng]
    
    
    
    puts "******************* log"
    puts params[:lat].nil?
    puts params[:lng].nil?
    puts params[:lat]
    puts params[:lng]
    # if post.lat.nil? || post.lng.nil? #좌표 선택 안했으면 저장하지 않고 돌려보냄. 
      # blabla
    # else
    post.save
      
    redirect_to new_post_path
    # end
  
  end

  def show
    @posts = Post.all
    @post = Post.find(params[:id])
    @comment = Comment.new
    
    require 'date'
    current_date = Date.today
    
    acq_price = @post.price
    trans_price = @post.money
    trans_date = Date.parse @post.date
    
    
    (trans_date - current_date) > 0 ? (@trans_daily_cost = trans_price / (trans_date - current_date).to_i) : (@trans_daily_cost = "취득일이 만료일보다 과거로 설정되어야 합니다.")
    (trans_date - current_date) > 0 ? (@discount_rate = ((1 - @trans_daily_cost/@acq_daily_cost.to_f)*100).round(2)) : (@discount_rate = nil)
    
    
    
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to posts_path

  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete

    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:title, :name, :price, :date, :money, :reason, :content, :category_id, :type_id, :user_id)
    end
 end