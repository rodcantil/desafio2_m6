class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  
  protected
  def after_sign_in_path_for(resource)
    notices_path
  end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :age])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :age])    
    end
    
    def authorize_request(kind = nil)
      unless kind.include?(current_user.role)
      redirect_to notices_path, notice: "No estas permitido a realizar esta accion."
      end
  end

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

end


