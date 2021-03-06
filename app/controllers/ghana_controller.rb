class GhanaController < ApplicationController

  #before_action :force_json, only: :search 

  before_action :disable_searchform





def index

  
@events = Event.all
@hows = How.all
@urbanterms = Urbanterm.all
@profiles = Profile.all
@listings = Listing.all
@songs = Song.all

@echos = Echo.all

  @tags = Tag.find(params[:id])
    @tags = Tags.all # list all echocategories on echocategory page

  #if params[:tag]

 #@hows = How.order("created_at desc").tagged_with(params[:tag])#.paginate(:page => params[:page], :per_page => 3)
 #@urban_terms = UrbanTerm.order("created_at desc").tagged_with(params[:tag])

 #else

  #@hows = How.all

  #@urban_terms = UrbanTerm.all

end   
  
#elsif query = params[:q].presence || "*"
      #@hows = How.search(query)#, page: params[:page], per_page: 2)




#else
  #@dhows = How.all.order("created_at desc")#.paginate(:page => params[:page], :per_page => 3)
  

    
  #end


    #@urban_terms = UrbanTerm.search(query)

     #@urban_terms = UrbanTerm.all
  #end

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
  


  def disable_searchform
  @disable_searchform = true
end

  def search
    @hows = How.ransack(title_cont: params[:q]).result(distinct: true)
    @events = Event.ransack(title_cont: params[:q]).result(distinct: true)
    @songs = Song.ransack(title_cont: params[:q]).result(distinct: true)
    @urbanterms = Urbanterm.ransack(title_cont: params[:q]).result(distinct: true)
    @profiles = Profile.ransack(title_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @hows = @hows.limit(5)
        @events = @events.limit(5)
        @songs = @songs.limit(5)
        @urbanterms = @urbanterms.limit(5)
        @profiles = @profiles.limit(5)
      }
    end
  end

  #private 

    #def force_json 
        #request.format = :json 
    #end 

end
