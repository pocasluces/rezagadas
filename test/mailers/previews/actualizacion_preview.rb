# Preview all emails at http://localhost:3000/rails/mailers/actualizacion
class ActualizacionPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/actualizacion/notificacion
  def notificacion

    post= EntradaBlog.last
    usuario = Usuario.first
    Actualizacion.notificacion(post, usuario)
  end

end
