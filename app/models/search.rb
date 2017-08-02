class Search < ActiveRecord::Base
    def search_posts
      posts = Post.all
      posts = posts.where(["title LIKE ?", "%#{keywords}%"]) if keywords.present?
      posts = posts.where(["category LIKE ?", category]) if category.present?
      
      return posts
      
    end
    
end
