class UrbantermsController < ApplicationController
  before_action :authenticate_profile!, :except => [:index, :show, :vote, :like ]
  before_action :set_urbanterm, only: [:show, :edit, :update, :destroy ]
  impressionist actions: [:show,:index], unique: [:session_hash]

  # GET /urbanterms
  # GET /urbanterms.json
  def index
    @urbanterms = Urbanterm.all.order(:cached_votes_score => :asc)
  end

  # GET /urbanterms/1
  # GET /urbanterms/1.json
  def show
    impressionist(@urbanterm)
    @urbanterm = Urbanterm.find(params[:id])
  end

  # GET /urbanterms/new
  def new
    @urbanterm = Urbanterm.new
    @tag = Tag.new
  end

  # GET /urbanterms/1/edit
  def edit
    @urbanterm = Urbanterm.friendly.find(params[:id])
    @tag = Tag.new
  end

  # POST /urbanterms
  # POST /urbanterms.json
  def create
    @urbanterm = current_profile.urbanterms.build(urbanterm_params)
    @tag = Tag.new



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



   #def vote
   #if !current_profile.liked? @urbanterm
   #@urbanterm.liked_by current_profile
   #elsif current_profile.liked @urbanterm
   #@urbanterm.unliked_by current_profile 
  #@link = Urbanterm.friendly.find(params[:id])
  #@link.upvote_by current_profile
  #redirect_to request.referer || root_path
#end  
#end 


#def downvote
  #@link = Urbanterm.friendly.find(params[:id])
  #@link.downvote_by current_profile
  #redirect_to request.referer || root_path
#end


def upvote
  @urbanterm = Urbanterm.find(params[:id])
  @urbanterm.upvote_by current_profile
    respond_to do |format|
      format.html {redirect_to request.referer || root_path }
      format.json { render json: { count: @urbanterm.liked_count } }
      format.js   { render :layout => false }
    end
end

def downvote
  @urbanterm =Urbanterm.find(params[:id])
  @urbanterm.downvote_by current_profile
  respond_to do |format|
   format.html {redirect_to request.referer || root_path }
   format.json { render json: { count: @urbanterm.unliked_count } }
   format.js   { render :layout => false }
 end
end








  # PATCH/PUT /urbanterms/1
  # PATCH/PUT /urbanterms/1.json
  def update
    @urbanterm = Urbanterm.friendly.find(params[:id])
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
      params.require(:urbanterm).permit(:title, :tag_list, :tag, { tag_ids: [] }, :tag_ids, :slug, :meaning1, :meaning2, :origin, :example1, :example2, :example3, :example4, :termcover, :termaudio)
    end
end
