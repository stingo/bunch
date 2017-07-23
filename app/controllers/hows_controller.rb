class HowsController < ApplicationController
  before_action :authenticate_profile!, :except => [:index, :show]
  before_action :set_how, only: [:show, :edit, :update, :destroy]

  # GET /hows
  # GET /hows.json
  def index
    @hows = How.all
  end

  # GET /hows/1
  # GET /hows/1.json
  def show
  end

  # GET /hows/new
  def new
    @how = How.new
  end

  # GET /hows/1/edit
  def edit
  end

  # POST /hows
  # POST /hows.json
  def create
    #@how = How.new(how_params)
    @how = current_profile.hows.build(how_params)

    respond_to do |format|
      if @how.save
        format.html { redirect_to @how, notice: 'How was successfully created.' }
        format.json { render :show, status: :created, location: @how }
      else
        format.html { render :new }
        format.json { render json: @how.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hows/1
  # PATCH/PUT /hows/1.json
  def update
    respond_to do |format|
      if @how.update(how_params)
        format.html { redirect_to @how, notice: 'How was successfully updated.' }
        format.json { render :show, status: :ok, location: @how }
      else
        format.html { render :edit }
        format.json { render json: @how.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hows/1
  # DELETE /hows/1.json
  def destroy
    @how.destroy
    respond_to do |format|
      format.html { redirect_to hows_url, notice: 'How was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_how
      @how = How.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def how_params
      params.require(:how).permit(:name, :description, :howcover, :video, :duration, :recipetips, :slug, :subtitle, :subtitle1, :subtitle2, :subtitle3, :subbody1, :subbody2, :subbody3)
    end
end
