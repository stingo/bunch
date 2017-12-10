class ContactsController < ApplicationController

def new
  @contact = Contact.new
  
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
  

def create
  @contact = Contact.new(:params[:contact])
  @contact.request = request
  if @contact.deliver
    flash.now[:error] = nil
  else
    flash.now[:error] = 'Cannot send message.'
    render new
  
end

end

end
