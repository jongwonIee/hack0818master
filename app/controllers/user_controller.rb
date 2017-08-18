class UserController < ApplicationController
  def mypage
  end
  
  def myposts
    @posts=Post.all.where(user_id: current_user.id)
  end
  
  def favorites_add
    if current_user.favorites_addition(params[:u_id].to_i, params[:c_id].to_i)
      redirect_to :back
    end
  end

  def favorites_delete
    if current_user.favorites_addition(params[:u_id].to_i, params[:c_id].to_i)
      redirect_to :back
    end
  end
end
