class Estado < ActiveRecord::Base
  has_many :rol
  has_many :tipomateria
  has_many :tipofalla
  has_many :alarma
  has_many :stockgabarra
  has_many :empresa
  has_many :locacion
  has_many :estatusgabarra
  has_many :silo
  has_many :meta
  has_many :proceso
  has_many :subproceso
  has_many :transporte
  has_many :tipostransporte
  has_many :equipo
  has_many :tipoequipo
  has_many :puntotolva
  has_many :tolva
  has_many :patio
  has_many :cliente
  has_many :usuario
  #has_many :novedades
  #has_many :tiposnovedades
  #has_many :almacenamiento
  #has_many :descarga
  #has_many :arribo
  #has_many :dosificacion
  #has_many :nivelessilo
  #has_many :medicionestolvas
  #has_many :apilamiento
  #has_many :alimentacion
  #has_many :despachos
  validates_presence_of :desc_estado, :message => 'La descripción de estado no puede ser vacía'
  
  # Guarda nuevos estados
  def self.guardar(params)
    estado = Estado.new(params)
      
    if estado.save
      true
    else
      raise Exceptions::PresenciaValoresExcepcion.new(estado.errors)
    end
  end
  
  # Actualiza estados existentes, a través del ID
  def self.actualizar(params)
    estado = Estado.find(params[:id])
    
    if estado.update_attributes(params[:estado])
      true
    else
      raise Exceptions::PresenciaValoresExcepcion.new(estado.errors)
    end    
  end 
end
