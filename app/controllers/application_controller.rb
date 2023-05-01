class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path
    when Store
      about_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      root_path
    when :store
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :postal_code, :address, :phone_number])
  end

end
