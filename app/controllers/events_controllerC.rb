class EventsController < ApplicationController
  before_action :authenticate_profile!, :except => [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
     @hows = How.all
  end

  # GET /events/1
  # GET /events/1.json
  def show

  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    #render :crop
  end

  # POST /events
  # POST /events.json


   def create
    @event = current_profile.events.build(event_params)
    if @event.save
      if params[:event][:eventpic].present?
        render :crop
      else
        redirect_to @event, notice: "Successfully created event."
      end
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      if params[:event][:eventpic].present?
        render :new
      else
        redirect_to @event, notice: "Successfully updated event."
      end
    else
      render :new
      end
    end


  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :eventdate, :crop_x, :crop_y, :crop_w, :crop_h, :eventpic, :slug, :end_date, :venue, thing_locations_attributes: [:id, :thing_location_id, :_destroy, location_ids: []], location_ids: [])
    end
end
