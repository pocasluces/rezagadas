class Actualizacion < ApplicationMailer


	def notificacion(post, usuariocorreo)
		@post = post
		@usuario = usuariocorreo
		mail to: @usuario.email, subject:'Bienvenido a Pocas Luces.'

	
	end

end
