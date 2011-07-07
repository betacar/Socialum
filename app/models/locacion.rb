class Locacion < ActiveRecord::Base
  set_table_name "locaciones"
  belongs_to :estado
  
  # Guarda nuevas locaciones
  def self.guardar(params)
    locacion = Locacion.new(params)
      
    if locacion.save
      true
    else
      raise Exceptions::PresenciaValoresExcepcion.new(locacion.errors)
    end
  end
  
  # Actualiza locaciones existente, a través del ID
  def self.actualizar(params)
    locacion = Locacion.find(params[:id])
    
    if locacion.update_attributes(params[:locacion])
      true
    else
      raise Exceptions::PresenciaValoresExcepcion.new(locacion.errors)
    end    
  end
  
  # Se cambia el estado de la tupla de Inactiva a Activa.
  def self.modificar_estado(id)
    locacion = Locacion.find(id)
       
    if (locacion.estado_id == 2)
      locacion.update_attribute(:estado_id, 1)
    else
      locacion.update_attribute(:estado_id, 2)
    end
  end
end
