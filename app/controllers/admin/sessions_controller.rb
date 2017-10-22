class Admin::SessionsController < Devise::SessionsController
  layout 'devise'

  def new
    super
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    if !session[:admin_return_to].blank?
      redirect_to session[:admin_return_to]
      session[:admin_return_to] = nil
    else
      respond_with resource, :location => after_sign_in_path_for(resource)
    end
  end

  def after_sign_in_path_for(resource)
    "/admin/dashboard"
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource)
    "/admin/login"
  end

end
