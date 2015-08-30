class CreateTipoContenidos < ActiveRecord::Migration
  def change
    create_table :tipo_contenidos do |t|
      t.integer :entrada_blog_id
      t.boolean :astrofoto
      t.boolean :metematica
      t.boolean :otro1
      t.boolean :otro2
      t.string :otrotxt

      t.timestamps null: false
    end
  end
end
