class CommentsController < ApplicationController
load_and_authorize_resource    
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.save

    redirect_to post_path(@post)
  end
  
  def edit
  end

  def update
  end

  def destroy
  end
  
    
    private
    def comment_params
      params.require(:comment).permit(:content) 
    end
    
end


  
  
  
