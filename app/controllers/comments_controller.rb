class CommentsController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token


    def create
        if !(Comment.where(:user_id => current_user.id, :movie_id => params[:movie_id]).exists?)
            @comment = Comment.create
            @comment.user_id = current_user.id
            @comment.user_name = current_user.name
            @comment.movie_id = params[:movie_id]
            @comment.content = params[:commentField]
            
            if @comment.save
                flash[:notice] = 'Comment was successfully created.'
            else
                flash[:alert] = 'You cannot add comment to the movie.'
            end
        else 
            flash[:alert] = 'Delete your previous comment to add new one.'
        end
        
        redirect_to :controller => 'movies', :action => 'index'
    end
    
    
    def destroy
        @comment_to_delete = Comment.find(params[:id])
        
        if @comment_to_delete.destroy
            flash[:notice] = 'Comment deleted successfully.'
        else
            flash[:alert] = 'Error deleting comment.'
        end
        
        redirect_to :controller => 'movies', :action => 'index'
    end
    
end