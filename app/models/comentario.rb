class Comentario < ActiveRecord::Base
	belongs_to :entrada_blog
	#validates_presence_of :titulo
end
