class Actualizacion < ApplicationMailer


	def notificacion(post, usuariocorreo)
		@post = post
		@usuario = usuariocorreo
		mail to: @usuario.email, subject:'Nuevos contenidos en pocasluces.es'

	
	end

end
