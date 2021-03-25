class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?
  before_action :authenticate_user!,except:[:top,:about,:public_action]
  
    def after_sign_out_path_for(resource)
      root_path
    end

    def after_sign_in_path_for(resource)
      user_path(resource.id)
    end  
    
    
  
  
  protected
    def configure_permitted_parameters
        if resource_class == User
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
            devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
            devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
        end
    end
end
