class UserController < ApplicationController
  def mypage
  end
  
  def myposts
    @posts=Post.all.where(user_id: 1)
  end
end
