class MapsController < ApplicationController
  def main
    @district = Category.all #구별 데이터 
    
    @query = params[:input_district] #드롭다운에서 사용자의 위치를 받는다. 
    
    if !@query #선택을 안하면 성균관대 위치
      @x = 37.584862
      @y = 126.997122
    else  #선택을 하면 그 지역을 center로 두고 보여준다. 
      @place = Category.where(name: @query)
      @x = @place.first.coorlat
      @y = @place.first.coorlong
    end
    
    @result = Post.joins(:type).merge(Type.where(name: @query_type))
    
    # @db_columns = Post.column_names #원래 column네임 뽑아서 해주려 했으나 필요없는 짓. ㅣ
    @result = Post.all #***** 추후 카테고리분류 필터 된 결과값으로 바꿔주어야 함! 
    @db_json = @result.as_json
    
    puts "****************log*************"
    @test_lat = params[:lat]
    @test_lng = params[:lng]
    
    
    puts @test_lat, @test_lat.nil?
    puts @test_lng, @test_lng.nil?
    puts @db_json[0].to_json
  end
  
end
