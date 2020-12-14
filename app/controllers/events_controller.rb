class EventsController  < ApplicationController
  @event = Event.new

  before_action :authorization

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
    @events = Event.paginate(page: params[:page], per_page: 5)
    @past_events = Event.past.paginate(page: params[:page], per_page: 5)
    @upcoming_events = Event.upcoming.paginate(page: params[:page], per_page: 5)
  end

  private

  def events_params
    params.require(:event).permit(:title, :description, :date)
  end   

end