class ProfilesController < ApplicationController
  before_action :authenticate_profile!, :except => [:index, :show]
  before_action :set_profile, only: [:show, :edit, :update]
  impressionist actions: [:show,:index], unique: [:session_hash]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    impressionist(@profile)

  end

  # GET /profiles/new
  #def new
    #@profile = Profile.new
  #end

  # GET /profiles/1/edit
  def edit








  end

  # POST /profiles
  # POST /profiles.json
  #def create
    #@profile = Profile.new(profile_params)

    #respond_to do |format|
      #if @profile.save
        #format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        #format.json { render :show, status: :created, location: @profile }
      #else
        #format.html { render :new }
        #format.json { render json: @profile.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :is_female, :slug, :date_of_birth, :pesnavatar, :summary, :loctown,
       :loccountry, :currjobtitle, :currtemployer, :curremployerstartdate,
       :employer2name, :employer2jobtitle, :employer2startdate, :employer2finishdate, :employer3name, :employer3jobtitle,
        :employer3startdate, :employer3finishdate, :employer4name,  :employer4jobtitle,  :employer4startdate, :employer4finishdate,
         :recentqualificationtitle, :recentqualificationname, :recentschoolname, 
        pesn_contacts_attributes: [:address1, :address2,
          :city, {typ_countries: :id}, {typ_regions: :id}, {typ_towns: :id}, {page: :id}, :postal_code, :email, 
          :business_number, :cell_number, :profile_id])


    end
end
