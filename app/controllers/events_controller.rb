class EventsController < ApplicationController
  def index
    @title = "All events"
    @events = Event.paginate(:page => params[:page])
    @event = Event.new
  end #of index

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:success] = "Your event has been created!"
      redirect_to @event
    else
      @title = "New event"
      render 'new'
    end
  end #of create

  def new
    @event = Event.new
    @title = "New event"
  end #of new

  def show
    @event = Event.find(params[:id])
    @events = Event.all
  end #of show
  
  def update
    @event = Event.find params[:id]
    @event.update_attributes params[:event]
  end #of update
end
  
