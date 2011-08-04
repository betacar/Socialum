class BaxGabarra < ActiveRecord::Base
  set_table_name 'vw_zarpes_gabarras'
  belongs_to :bax
  has_many :Ensayos
  
  # Se define como de solo lectura por ser una vista de BD
  protected
    def after_initialize
      readonly!
    end
    
    def before_destroy
      raise ActiveRecord::ReadOnlyRecord
    end
end