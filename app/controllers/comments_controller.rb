class CommentsController < ApplicationController
  def create
	@post = Post.find(params[:post_id])
	@comment = @post.comments.build(comment_params)
	@comment.save
	
	redirect_to @post
  end

	def comment_params
		params.require(:comment).permit(:text)
	end

  def destroy
	@comment = Comment.find(params[:id])
	@comment.destroy
	
	redirect_to @comment.post
  end
end
