class Ensayo < ActiveRecord::Base
  set_table_name 'vw_analisis_lab'
  belongs_to :BaxGabarras, :foreign_key => :gabarra_id
  has_one :Bax
  
  # Se define como de solo lectura por ser una vista de BD
  protected
    def after_initialize
      readonly!
    end
    
    def before_destroy
      raise ActiveRecord::ReadOnlyRecord
    end
end
