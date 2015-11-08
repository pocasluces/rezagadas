class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]

  before_action :usuario_vacio, only: [:new, :create]

  # GET /comentarios
  # GET /comentarios.json
  def index
    @comentarios = Comentario.all
  end

  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
  end

  # GET /comentarios/new
  def new
    @comentario = Comentario.new
  end

  # GET /comentarios/1/edit
  def edit
  end

  # POST /comentarios
  # POST /comentarios.json
  def create

    @entradablog = EntradaBlog.find(params[:entrada_blog_id])

    @comentario = @entradablog.comentarios.create(comentario_params)

    respond_to do |format|
      if @comentario.save
        format.html { redirect_to @entradablog, notice: 'Comentario creado correctamente.' }
        format.json { render :show, status: :created, location: @entrada_blog }
      else
        format.html { redirect_to @entradablog, notice: 'Error al crear el comentario. Falta el nombre o el cuerpo del mensaje.'}
      end
    end
  end

  # PATCH/PUT /comentarios/1
  # PATCH/PUT /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to @comentario, notice: 'Comentario was successfully updated.' }
        format.json { render :show, status: :ok, location: @comentario }
      else
        format.html { render :edit }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @comentario.destroy
    respond_to do |format|
      format.html { redirect_to comentarios_url, notice: 'Comentario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end


    def usuario_vacio

      anon_user = params[:alias]
    
      if anon_user.blank?
        params[:alias] = 'Anónimo'
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_params
      params.require(:comentario).permit(:entrada_blog_id, :body, :alias)
    end
end
