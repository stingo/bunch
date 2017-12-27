class HowcategoriesController < ApplicationController
  before_action :authenticate_profile!, :except => [:index, :show]
  before_action :set_howcategory, only: [:show, :edit, :update, :destroy]

  # GET /howcategories
  # GET /howcategories.json
  def index
    @howcategories = Howcategory.all
  end

  # GET /howcategories/1
  # GET /howcategories/1.json
  def show
    @howcategory = Howcategory.friendly.find(params[:id])
    @howcategories = Howcategory.all # list all howcategories on howcategory page
  end

  # GET /howcategories/new
  def new
    @howcategory = Howcategory.new
  end

  # GET /howcategories/1/edit
  def edit
    @howcategory = Howcategory.friendly.find(params[:id])
  end

  # POST /howcategories
  # POST /howcategories.json
  def create
     @howcategory = current_profile.howcategories.build(howcategory_params)

    respond_to do |format|
      if @howcategory.save
        format.html { redirect_to @howcategory, notice: 'Howcategory was successfully created.' }
        format.json { render :show, status: :created, location: @howcategory }
      else
        format.html { render :new }
        format.json { render json: @howcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /howcategories/1
  # PATCH/PUT /howcategories/1.json
  def update
    @howcategory = Howcategory.friendly.find(params[:id])
    respond_to do |format|
      if @howcategory.update(howcategory_params)
        format.html { redirect_to @howcategory, notice: 'Howcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @howcategory }
      else
        format.html { render :edit }
        format.json { render json: @howcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /howcategories/1
  # DELETE /howcategories/1.json
  def destroy
    @howcategory.destroy
    respond_to do |format|
      format.html { redirect_to howcategories_url, notice: 'Howcategory was successfully destroyed.' }
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
    def set_howcategory
      @howcategory = Howcategory.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def howcategory_params
      params.require(:howcategory).permit(:name, :description, :slug)
    end
end
