class CalculatorController < ApplicationController
  def input
    
  end

  def result
    require 'date'
    current_date = Date.today
    
    acq_price = params[:acq_price].to_i
    acq_period = params[:acq_period].to_i
    trans_price = params[:trans_price].to_i
    trans_date = Date.parse params[:trans_date]
    
    
    @acq_daily_cost = acq_price / (acq_period * 30)
    (trans_date - current_date) > 0 ? (@trans_daily_cost = trans_price / (trans_date - current_date).to_i) : (@trans_daily_cost = "취득일이 만료일보다 과거로 설정되어야 합니다.")
    (trans_date - current_date) > 0 ? (@discount_rate = ((1 - @trans_daily_cost/@acq_daily_cost.to_f)*100).round(2)) : (@discount_rate = nil)
    
    
  end
end
