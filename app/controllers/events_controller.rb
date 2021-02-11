class EventsController < ApplicationController

  before_action :user_signed_in?, only: [:new]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = User.find(session[:current_user_id]).created_events.build(event_params)
    if @event.save
      redirect_to user_path(session[:current_user_id])
    else
      render :new
    end
  end

  def attend
    @event = Event.find(params[:id])
    user = User.find_by(id: session[:current_user_id])

    if @event.attendees.include?(user)
      redirect_to @event, notice: "You're already attending this event!"
    else
      @event.attendees << user
      redirect_to @event
    end
  end

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end

  def user_signed_in?
    unless User.exists?(id: session[:current_user_id])
      redirect_to new_session_path, notice: "You need to sign in!"
    end
  end
end
