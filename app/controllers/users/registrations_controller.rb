class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    user_params = params.require(:user).permit(:name, :email, :role_id,
                                               :junior_enterprise_id,
                                               :area_id)

    respond_to do |format|
      if RequestHistory.create(name: user_params[:name],
                               email: user_params[:email],
                               role_id: user_params[:role_id],
                               junior_enterprise_id: user_params[:junior_enterprise_id],
                               area_id: user_params[:area_id],
                               approved: false)

        format.html { redirect_to new_user_registration_path, notice: 'A requisição foi feita ao administrador.' }
      else
        format.html { redirect_to new_user_registration_path, notice: 'Algo deu errado :c' }
      end
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.:
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:junior_enterprise_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:area_id])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :attribute
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

end
