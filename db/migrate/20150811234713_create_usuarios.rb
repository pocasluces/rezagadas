class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :Nombre
      t.string :email
      t.string :codigo
      t.boolean :solofotos
      t.boolean :solomates
      t.boolean :completo

      t.timestamps null: false
    end
  end
end
