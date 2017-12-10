class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_location #Redirect to previous page after sign in




   protected



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |profile_params|
    profile_params.permit(:first_name, :last_name, :email, :username, :password, :password_confirmation, :is_female, :date_of_birth)
  end

  devise_parameter_sanitizer.permit(:account_update) do |profile_params|
    profile_params.permit(:displayname, :first_name, :last_name, :username, :email, :password, :password_confirmation, :is_female, :date_of_birth, :pesnavatar)
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





  end
end
