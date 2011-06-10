class CreateTipoFallas < ActiveRecord::Migration
  def self.up
    create_table :tipos_fallas do |t|
      t.references :estado, :null => false, :default => 1
      t.string :desc_tipo_falla, :null => false
      t.integer :usuario_id_created, :null => false
      t.integer :usuario_id_updated

      t.timestamps
    end
  end

  def self.down
    drop_table :tipos_fallas
  end
end
