class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_profile!, :except => [:index, :show]
  impressionist actions: [:show,:index], unique: [:session_hash]

  # GET /jobs
  # GET /jobs.json
  def index
     if params[:company].blank? 
      #@posts = Post.all.order("created_at DESC")
    @jobs = Job.all.order("created_at DESC")

     else

    @company_id = Company.find_by(name: params[:company]).id
    @jobs = Job.where(company_id: @company_id).order("created_at DESC")

    #@companysize_id = Companysize.find_by(name: params[:companysize]).id
    #@companies = Company.where(companysize_id: @companysize_id).order("created_at DESC"

  #respond_to do |format|
      #format.html
      #format.js # add this line for your js template
    #end
    end

 
  end



 






  # GET /jobs/1
  # GET /jobs/1.json
  def show
    impressionist(@job)




    @job = Job.friendly.find(params[:id])

    #@company_jobs = @company.jobs.order("created_at DESC") #important! to enable users posts on user profile
  
  end

  # GET /jobs/new
  def new
    @job = Job.new

    #@companies = Company.all.map{ |c| [c.name, c.id] } #company relationship
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.friendly.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    #@job = Job.new(job_params)
    @job = current_profile.jobs.build(job_params)


    #@job.company_id = params[:job_id]#company relationship

   

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update

    @job = Job.friendly.find(params[:id])

    #@job.company_id = params[:company_id]#company relationship





    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :main_responsibilities, :main_requirements, :your_name, :phone, :jobtype_id, :min_salary, :max_salary, :slug, :company_id, :company_name, :companylogo, thing_locations_attributes: [:id, :thing_location_id, :_destroy, location_ids: []], location_ids: [], thing_companies_attributes: [:id, :thing_company_id, :_destroy, company_ids: []], company_ids: [] )
    end
end
