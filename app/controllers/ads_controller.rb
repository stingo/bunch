class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_profile!, :except => [:index, :show]
  impressionist actions: [:show,:index], unique: [:session_hash]

  # GET /ads
  # GET /ads.json
  def index
    @ads = Ad.all
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
    @ad = Ad.friendly.find(params[:id])
    impressionist(@ad)
  end

  # GET /ads/new
  def new
    @ad = Ad.new
    @tag = Tag.new
  end

  # GET /ads/1/edit
  def edit
    @ad = Ad.friendly.find(params[:id])
  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = current_profile.ads.build(ad_params)

    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render :show, status: :created, location: @ad }
      else
        format.html { render :new }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    respond_to do |format|
      @ad = Ad.friendly.find(params[:id])
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: 'Ad was successfully destroyed.' }
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
    def set_ad
      @ad = Ad.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:name, :description, :price, :slug, :website_link, :youtube_video_link, 
        :ad_details,)
    end
end
