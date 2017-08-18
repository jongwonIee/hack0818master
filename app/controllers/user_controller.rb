class UserController < ApplicationController
  def mypage
  end
  
  def myposts
    @posts=Post.all.where(user_id: current_user.id)
  end
end
