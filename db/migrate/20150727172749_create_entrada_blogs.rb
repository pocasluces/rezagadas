class CreateEntradaBlogs < ActiveRecord::Migration
  def change
    create_table :entrada_blogs do |t|
      t.string :titulo
      t.text :body
      t.string :imagen
      t.text :otro1
      t.text :otro2

      t.timestamps null: false
    end

     #add_attachment :entrada_blogs, :image
  end
end
