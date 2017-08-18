class User < ActiveRecord::Base
  rolify
  has_many :posts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
  def favorites_addition(user_id, post_id)
    Favorite.create(user_id: user_id, post_id: post_id)
  end

  def favorites_deletion(user_id, post_id)
    favorite = Favorite.where("user_id = ? AND post_id = ?", user_id, post_id)
    Favorite.destroy(favorite.first.id)
  end       
end
