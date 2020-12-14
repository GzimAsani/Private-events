class EventsController  < ApplicationController
  @event = Event.new


  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.build(events_params)
    if @event.valid? && @event.save
      redirect_to user_path(current_user), notice: 'Event Created Successfully'
    else
      render 'new'
    end
  end

  def index
    @events = Event.all
  end

  private

  def events_params
    params.require(:event).permit(:title, :description, :date)
  end   

end