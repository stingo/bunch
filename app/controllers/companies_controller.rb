class CompaniesController < ApplicationController

  before_action :authenticate_profile!, :except => [:index, :show]
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  impressionist actions: [:show,:index], unique: [:session_hash]

  # GET /companies
  # GET /companies.json
  def index

    if params[:companytype].blank? 
      #@posts = Post.all.order("created_at DESC")
    @companies = Company.all

     else

    @companytype_id = Companytype.find_by(name: params[:companytype]).id
    @companies = Company.where(companytype_id: @companytype_id).order("created_at DESC")

    #@companysize_id = Companysize.find_by(name: params[:companysize]).id
    #@companies = Company.where(companysize_id: @companysize_id).order("created_at DESC")



respond_to do |format|
      format.html
      format.js # add this line for your js template
    end
    end

 
  end

 

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.friendly.find(params[:id])
    @company_jobs = @company.jobs #paginate(page: params[:page], per_page: 5)
    @company_listings = @company.listings #paginate(page: params[:page], per_page: 5)
    @company_profiles = @company.profiles #paginate(page: params[:page], per_page: 5)

    impressionist(@company)
     #@how = How.find(params[:id])
     
  end

  # GET /companies/new
  def new
    @company = Company.new

    @companytypes = Companytype.all.map{ |c| [c.name, c.id] }
  end

  # GET /companies/1/edit
  def edit
    @company = Company.friendly.find(params[:id])

    #@companytypes = Companytype.all.map{ |c| [c.name, c.id] }
  end

  # POST /companies
  # POST /companies.json
  def create
   
    @company = current_profile.companies.build(company_params)

    @company.companytype_id = params[:company_id]


    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @company = Company.friendly.find(params[:id])

    @company.companytype_id = params[:companytype_id]



    respond_to do |format|

      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :about, :companytype_id, :companytype_name, :skill_list, :skill, { skill_ids: [] }, :skill_ids,
       :tag_list, :tag, { tag_ids: [] }, :tag_ids, :services, :yearfounded, :companyemail,
       :contactphone, :video1, :video2, :companysize_id, :facebookurl, :twitterurl, :linkedinurl, :googleplusurl, :pinteresturl,
        :instagramurl, :companylogo, :remove_companycover, :remove_companylogo, :slug, :companycover, :websiteurl, 
        thing_locations_attributes: [:id, :thing_location_id, :_destroy, location_ids: []], location_ids: [], 
        thing_industries_attributes: [:id, :thing_cindustry_id, :_destroy, industry_ids: []], industry_ids: [] )
    end
end
