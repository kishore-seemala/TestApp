class PostsController < ApplicationController
  
   layout "application"

   before_filter :get_post_object, :only => [:show, :edit, :update, :destroy]
 
   private

   def get_post_object
       
      @post = Post.find_by_id(params[:id])	
      if @post.nil?
        flash[:notice] = "Sorry, no post was found"
        redirect_to posts_path
      end

   end
   
   public

   def index

      @posts = Post.all

   end

   def show
      @comment = Comment.new
   end
   
   def edit

   end

   def new

      @post= Post.new

   end

   def create

      @post = Post.new(params[:post])
      if @post.save
         flash[:notice]	= "Post has been successfully created"
	 redirect_to posts_path
       else
         render :action => :new
       end

   end


   def update

      if @post.update_attributes(params[:post])

	 flash[:notice]="Post has been successfully updated"
       redirect_to posts_path

      else

         render :action => :edit

      end

   end

   def destroy

     @post.destroy
     flash[:notice] = "Successfully deleted the post."
     redirect_to posts_path	      
   
   end

end
