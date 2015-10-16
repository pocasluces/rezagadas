class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.integer :entrada_blog_id
      t.text :body, :default => 'Me gusta.'
      t.string :alias , :default => 'Anónimo'

      t.timestamps null: false
    end
  end
end
