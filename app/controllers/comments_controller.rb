class CommentsController < ApplicationController
  
#  before_filter :authenticate, :only => :destroy
# 
    before_filter :current_user
      
  
    def create
        @post = Post.find(params[:post_id])
        @user = @current_user
        @comment = @post.comments.create(params[:comment])
        redirect_to post_path(@post)
      end
      
    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to post_path(@post)
    end
    
    def current_user
          @current_user = User.find(session[:user_id]) if session[:user_id]
        end
        
    
    
end
