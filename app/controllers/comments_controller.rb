class CommentsController < ApplicationController

before_filter :get_post

private

def get_post
   @post = Post.find_by_id(params[:post_id])
   if @post.nil?
      flash[:notice] = "Sorry, no post found!"
      redirect_to posts_path
   end
end

public

def create
   @comment = @post.comments.build(params[:comment])
   if @comment.save
      flash[:notice] = "Comment Successfully saved..!!"
      redirect_to post_path(@post)
   else
      flash[:notice] = "Errors in saving the comment. Please try again.."
      redirect_to post_path(@post)
   end
end

def destroy
  
   @comment = Comment.where(:post_id => params[:post_id], :id => params[:id])
   @comment.destroy_all
   flash[:notice] = "Successfully deleted the comment"
   redirect_to post_path(@post)

end

end
