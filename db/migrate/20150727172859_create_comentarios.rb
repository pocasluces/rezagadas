class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.integer :entrada_blog_id
      t.text :body
      t.string :alias

      t.timestamps null: false
    end
  end
end
