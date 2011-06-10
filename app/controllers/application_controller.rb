# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout :layout_por_recurso
  
  filter_parameter_logging(:password) # Previene que se muestre el valor de las contraseñas en el log de la app
  #before_filter :authenticate_usuario! # Autentica cada usuario contra LDAP antes de ejecutar cualquier controller
    
  protected
  def stored_location_for (resource)
    return nil
  end
  
  # Determina si un recurso en particular pertenece a 
  # Devise o a la aplicación para luego asignarle un layout específico
  def layout_por_recurso
    if devise_controller?
      "login"
    else
      "application"
    end
  end

end
