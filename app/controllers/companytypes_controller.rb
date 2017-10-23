class CompanytypesController < ApplicationController
  before_action :set_companytype, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_profile!

  # GET /companytypes
  # GET /companytypes.json
  def index
    @companytypes = Companytype.all
  end

  # GET /companytypes/1
  # GET /companytypes/1.json
  def show
  end

  # GET /companytypes/new
  def new
    @companytype = Companytype.new

    #@companytype = current_profile.companytypes.build
  end

  # GET /companytypes/1/edit
  def edit
  end

  # POST /companytypes
  # POST /companytypes.json
  def create
    @companytype = current_profile.companytypes.build(companytype_params)

  

    respond_to do |format|
      if @companytype.save
        format.html { redirect_to @companytype, notice: 'Companytype was successfully created.' }
        format.json { render :show, status: :created, location: @companytype }
      else
        format.html { render :new }
        format.json { render json: @companytype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companytypes/1
  # PATCH/PUT /companytypes/1.json
  def update
    respond_to do |format|
      if @companytype.update(companytype_params)
        format.html { redirect_to @companytype, notice: 'Companytype was successfully updated.' }
        format.json { render :show, status: :ok, location: @companytype }
      else
        format.html { render :edit }
        format.json { render json: @companytype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companytypes/1
  # DELETE /companytypes/1.json
  def destroy
    @companytype.destroy
    respond_to do |format|
      format.html { redirect_to companytypes_url, notice: 'Companytype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_companytype
      @companytype = Companytype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def companytype_params
      params.require(:companytype).permit(:name, :desc)
    end
end
