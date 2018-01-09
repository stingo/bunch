class AlltagsController < ApplicationController
  before_action :authenticate_profile!, :except => [:index, :show]
  before_action :set_how, only: [:show, :edit, :update, :destroy]
  impressionist actions: [:show,:index], unique: [:session_hash]



  # GET /hows
  # GET /hows.json
  def index

  if params[:tag]

  @hows = How.order("created_at desc").tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 20)
  @echos = Echo.order("created_at desc").tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 20)

  
  else

  @hows = How.order("created_at desc").paginate(:page => params[:page], :per_page => 20)
  @echos = Echo.order("created_at desc").paginate(:page => params[:page], :per_page => 20)

  respond_to do |format|
      format.html
      format.js # add this line for your js template
    end
    end

  @howcategories = Howcategory.all

  @comment = Comment.all.order("created_at DESC")
 
  end



  # GET /hows/1
  # GET /hows/1.json
  def show
    impressionist(@how)
     #@how = How.find(params[:id])
     @how = How.friendly.find(params[:id])
     
  end

  # GET /hows/new
  def new
    @how = How.new
    @tag = Tag.new
  end

  # GET /hows/1/edit
  def edit
    @how = How.friendly.find(params[:id])

  end

  # POST /hows
  # POST /hows.json
  def create
    #@how = How.new(how_params)
    @how = current_profile.hows.build(how_params)

    @how.howcategory_id = params[:howcategory_id]

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
    @how = How.friendly.find(params[:id])
    @how.howcategory_id = params[:howcategory_id]

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
    def set_how
      #@how = How.find(params[:id])
      @how = How.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def how_params
      params.require(:how).permit(:title, :description, :howcover, :videourl, :minutes, :hints_and_tips, :slug,  
 :subtitle, :subtitle1, :subtitle2, :subtitle3, :howcategory_id, :subbody1, :subbody2, 
 :references, :created_at, :hours, :days, :updated_at, :ingredients, :tag_list, :tag, { tag_ids: [] }, :tag_ids, )
    end
end