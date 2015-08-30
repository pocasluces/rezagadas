class MailUsuario < ApplicationMailer

	default from: 'noresponder@pocasluces.es'

	def email_bienvenida(usuario)
		@usuario = usuario
		mail to: usuario.email, subject:'Bienvenido a Pocas Luces.'
	end




end
