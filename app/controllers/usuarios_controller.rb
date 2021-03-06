class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  



  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  def new
    @usuario = Usuario.new
  end
  
def create
    @usuario = Usuario.new(usuario_params)


    respond_to do |format|
      #se guarda el usuario si el captcha está escrito correctamente.
      if @usuario.save_with_captcha

        #se envía el correo de confirmación de la creación de usuario.
        MailUsuario.email_bienvenida(@usuario).deliver_now


        format.html { redirect_to :back, notice: 'Suscripción creada correctamente.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { redirect_to :back, notice: 'Error en la suscripción. Comprueba que has escrito tu nombre, email o captcha correctamente.' }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new


  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:Nombre, :email, :codigo, :captcha, :captcha_key)
    end
end
