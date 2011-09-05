class Novedad < ActiveRecord::Base
  set_table_name 'novedades'
  belongs_to :proceso, :polymorphic => true
  belongs_to :tipo_novedad
  stampable
  attr_accessor :login, :inicio_evento, :fin_evento
end