# Preview all emails at http://localhost:3000/rails/mailers/mail_usuario
class MailUsuarioPreview < ActionMailer::Preview

	def Bienvenido
		MailUsuario.email_bienvenida Usuario.new(Nombre: 'Carlos', email: 'carlos@prueba.es')
	end

end
