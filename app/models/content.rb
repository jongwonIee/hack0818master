class Content < ActiveRecord::Base
    resourcify
    belongs_to :user
end
