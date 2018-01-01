class CommentsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @commentators = Comment.group(:user_name).where('comments.created_at >= ?', 7.days.ago).limit(10).order('count_all desc').count
  end

  def create
    if (Comment.where(:user_id => current_user.id, :movie_id => params[:movie_id]).length == 0) &&
      Comment.new(params_comment).save
      flash[:notice] = 'Comment was successfully created.'
    else
      flash[:alert] = 'You cannot add new comment:
        1. delete your previous comment to add new one OR
        2. comment field cannot be empty - min. length 2 characters'
    end
    redirect_back(fallback_location: root_path)
  end
    
  def destroy
    if Comment.find(params[:id]).destroy
      flash[:notice] = 'Comment deleted successfully.'
    else
      flash[:alert] = 'Error deleting comment.'
    end
    redirect_back(fallback_location: root_path)
  end

  def params_comment
    params.require(:commentForm).permit(:content, :user_id, :movie_id, :user_name)
  end
end
