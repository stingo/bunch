class EchocategoriesController < ApplicationController
  before_action :set_echocategory, only: [:show, :edit, :update, :destroy]

  # GET /echocategories
  # GET /echocategories.json
  def index
    @echocategories = Echocategory.all
  end

  # GET /echocategories/1
  # GET /echocategories/1.json
  def show
    @echocategory = Echocategory.friendly.find(params[:id])
  end

  # GET /echocategories/new
  def new
    @echocategory = Echocategory.new
  end

  # GET /echocategories/1/edit
  def edit
    @echocategory = Echocategory.friendly.find(params[:id])
  end

  # POST /echocategories
  # POST /echocategories.json
  def create
    @echocategory = current_profile.echocategories.build(echocategory_params)

    respond_to do |format|
      if @echocategory.save
        format.html { redirect_to @echocategory, notice: 'Echocategory was successfully created.' }
        format.json { render :show, status: :created, location: @echocategory }
      else
        format.html { render :new }
        format.json { render json: @echocategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /echocategories/1
  # PATCH/PUT /echocategories/1.json
  def update

    @echocategory = Echocategory.friendly.find(params[:id])


    respond_to do |format|
      if @echocategory.update(echocategory_params)
        format.html { redirect_to @echocategory, notice: 'Echocategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @echocategory }
      else
        format.html { render :edit }
        format.json { render json: @echocategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /echocategories/1
  # DELETE /echocategories/1.json
  def destroy
    @echocategory.destroy
    respond_to do |format|
      format.html { redirect_to echocategories_url, notice: 'Echocategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  #Redirect to previous page after sign in

   def store_location
    if(request.path != "/profiles/sign_in" &&
      request.path != "/profiles/sign_up" &&
      request.path != "/profiles/password/new" &&
      request.path != "/profiles/password/edit" &&
      request.path != "/profiles/confirmation" &&
      request.path != "/uprofiles/sign_out" &&
      !request.xhr? && !current_profile) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end
  def after_sign_in_path_for(resource)
    previous_path = session[:previous_url]
    session[:previous_url] = nil
    previous_path || root_path
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_echocategory
      @echocategory = Echocategory.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def echocategory_params
      params.require(:echocategory).permit(:name, :description, :echocatimage, :slug)
    end
end
