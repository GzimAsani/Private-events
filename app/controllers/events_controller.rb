class EventsController  < ApplicationController

  def new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
  end

  def index
    @events = Event.all
  end

  private

  def events_params
    params.require(:event).permit(:name, :date, :location, :description, :user_id)
  end   

end