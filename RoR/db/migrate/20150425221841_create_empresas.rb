class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|

      t.timestamps null: false
    end
  end
end
