class CommentsController < ApplicationController
  def index
    @event=Event.find(params[:id])
    @guests=Guest.where(event_id:params[:id])
    @comment=Comment.new
    @comments=Comment.where(event_id:params[:id])
  end

  def create

    @comment = Comment.new(user_id:session[:user_id], event_id:params[:id], content:params[:comment][:content])
    # binding.pry
    if @comment.save
      # binding.pry
      redirect_to :back
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
  end
  def comment_params
    params.require(:comment).permit(:content)
  end

end
