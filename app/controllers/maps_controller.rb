class MapsController < ApplicationController
  def main
    @district = Category.all
    
    @query = params[:input_district]
    
    if !@query
      @x = 37.584862
      @y = 126.997122
    else  
      @place = Category.where(name: @query)
      @x = @place.first.coorlat
      @y = @place.first.coorlong
    end
  end
end
