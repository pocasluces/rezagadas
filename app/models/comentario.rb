class Comentario < ActiveRecord::Base
	belongs_to :entrada_blog

	validates :entrada_blog, :presence => true
	validates :alias, :presence => true
	validates :body, :presence => true



end
