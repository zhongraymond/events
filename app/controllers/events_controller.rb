class EventsController < ApplicationController
  def index
      @user = User.find(session[:user_id])
      @events1 = Event.where(location_state:current_user.location_state.to_s)
      @events2 = Event.where.not(location_state:current_user.location_state.to_s)
      @guests = Guest.all
      @event = Event.new
      @guest = Guest.new
      # binding.pry
  end

  def create
    # binding.pry
    @event = Event.new(event_params)
    if @event.save
      # binding.pry
      redirect_to "/events/"
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to "/events/"
    end
  end

def join
  # binding.pry
  @join = Guest.new(user_id:session[:user_id],event_id:params[:id])
    if @join.save
      # binding.pry
      redirect_to "/events/"
  else
    flash[:errors] = @event.errors.full_messages
    redirect_to "/events/"
  end
end

def unjoin
  # binding.pry
  join = Event.find(params[:id]).guests.where(user_id:session[:user_id])
  join.destroy_all
  redirect_to "/events/"
end

def destroy
  # binding.pry
  event = Event.find(params[:id]).delete
  redirect_to '/events/'
end

private
def event_params
  params.require(:event).permit(:user_id, :name, :location, :location_state, :date)
end

end
