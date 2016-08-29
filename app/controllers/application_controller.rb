class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => exception.message
  end

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def after_sign_in_path_for(resource)
    home_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected


  def configure_permitted_parameters
       registration_params = [:first_name, :profile_id, :email, :password, :password_confirmation]

       if params[:action] == 'update'
         devise_parameter_sanitizer.permit(:account_update) {
           |u| u.permit(registration_params << :current_password)
         }
       elsif params[:action] == 'create'
         devise_parameter_sanitizer.permit(:sign_up) {
           |u| u.permit(registration_params)
         }
       end
  end

  # Esses atributos podem ser adicionados nos controllers do Devise

  #  def configure_devise_permitted_parameters
  #    registration_params = [:first_name, :profile_id, :email, :password, :password_confirmation]
   #
  #    if params[:action] == 'update'
  #      devise_parameter_sanitizer.for(:account_update) {
  #        |u| u.permit(registration_params << :current_password)
  #      }
  #    elsif params[:action] == 'create'
  #      devise_parameter_sanitizer.for(:sign_up) {
  #        |u| u.permit(registration_params)
  #      }
  #    end
  #  end

end
