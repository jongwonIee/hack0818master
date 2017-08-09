class CommentsController < ApplicationController
    


  def create
    comment = Comment.new(comment_params)
    comment.post_id = parmas[:post_id]
    comment.save

    redirect_to contents_path
  end
    
    private
    def comment_params
       params.require(:comment).permit(:content) 
    end
    
end
