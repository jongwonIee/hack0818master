class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    belongs_to :type
     has_many :comments
     
    def self.search(search)
        if search
            where('title LIKE ?', "%#{search}%")
        else
            all
        end
    end
  
end