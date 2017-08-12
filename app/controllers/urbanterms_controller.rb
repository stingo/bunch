class UrbantermsController < ApplicationController
  before_action :authenticate_profile!, :except => [:index, :show]
  before_action :set_urbanterm, only: [:show, :edit, :update, :destroy]

  # GET /urbanterms
  # GET /urbanterms.json
  def index
    @urbanterms = Urbanterm.all
  end

  # GET /urbanterms/1
  # GET /urbanterms/1.json
  def show
  end

  # GET /urbanterms/new
  def new
    @urbanterm = Urbanterm.new
  end

  # GET /urbanterms/1/edit
  def edit
  end

  # POST /urbanterms
  # POST /urbanterms.json
  def create
    @urbanterm = Urbanterm.new(urbanterm_params)

    respond_to do |format|
      if @urbanterm.save
        format.html { redirect_to @urbanterm, notice: 'Urbanterm was successfully created.' }
        format.json { render :show, status: :created, location: @urbanterm }
      else
        format.html { render :new }
        format.json { render json: @urbanterm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urbanterms/1
  # PATCH/PUT /urbanterms/1.json
  def update
    respond_to do |format|
      if @urbanterm.update(urbanterm_params)
        format.html { redirect_to @urbanterm, notice: 'Urbanterm was successfully updated.' }
        format.json { render :show, status: :ok, location: @urbanterm }
      else
        format.html { render :edit }
        format.json { render json: @urbanterm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urbanterms/1
  # DELETE /urbanterms/1.json
  def destroy
    @urbanterm.destroy
    respond_to do |format|
      format.html { redirect_to urbanterms_url, notice: 'Urbanterm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urbanterm
      @urbanterm = Urbanterm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urbanterm_params
      params.require(:urbanterm).permit(:title, :meaning1, :meaning2, :origin, :example1, :example2, :example3, :example4, :termcover, :termaudio)
    end
end
