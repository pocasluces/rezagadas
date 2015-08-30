class EntradaBlog < ActiveRecord::Base

	has_many :comentarios, dependent: :destroy

	has_one :tipo_contenido

	accepts_nested_attributes_for :tipo_contenido

	has_attached_file :image, styles: { large: '900'    ,medium: '200x200>', thumb: '48x48>' }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
