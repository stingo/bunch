class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

   protected



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |profile_params|
    profile_params.permit(:first_name, :last_name, :email, :username, :password, :password_confirmation, :is_female, :date_of_birth)
  end

  devise_parameter_sanitizer.permit(:account_update) do |profile_params|
    profile_params.permit(:displayname, :first_name, :last_name, :username, :email, :password, :password_confirmation, :is_female, :date_of_birth, :pesnavatar)
  end


  end
end
