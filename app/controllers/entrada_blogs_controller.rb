class EntradaBlogsController < ApplicationController
  before_action :set_entrada_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, except: [:index, :foto, :mates, :show]


#comento el layout, porque ahora uso un ocn el mismo nombre del controlador.
#layout 'generic_layout'



  # GET /entrada_blogs
  # GET /entrada_blogs.json

   def index
    @entrada_blogs = EntradaBlog.all
  end

  def editablog
    @entrada_blogs = EntradaBlog.all 
  end

  def foto
        @entrada_blogs = EntradaBlog.find_by_sql("select entrada_blogs.* from entrada_blogs inner join tipo_contenidos
    ON entrada_blogs.id=tipo_contenidos.entrada_blog_id and tipo_contenidos.astrofoto = 't'")
  end
  def mates
    @entrada_blogs = EntradaBlog.find_by_sql("select entrada_blogs.* from entrada_blogs inner join tipo_contenidos
    ON entrada_blogs.id=tipo_contenidos.entrada_blog_id and tipo_contenidos.metematica = 't'")
  end



  # GET /entrada_blogs/1
  # GET /entrada_blogs/1.json
  def show
  end

  # GET /entrada_blogs/new
  def new
    @entrada_blog = EntradaBlog.new
    @entrada_blog.build_tipo_contenido
  end

  # GET /entrada_blogs/1/edit
  def edit
  end

  # POST /entrada_blogs
  # POST /entrada_blogs.json
  def create
    @entrada_blog = EntradaBlog.new(entrada_blog_params)
    @usuarios = Usuario.all

    respond_to do |format|
      if @entrada_blog.save

            @usuarios.each do |usuario| 
            @usuario_correo = usuario
                 Actualizacion.notificacion(@entrada_blog, @usuario_correo).deliver_now
            end

        format.html { redirect_to @entrada_blog, notice: 'Entrada blog was successfully created.' }
        format.json { render :show, status: :created, location: @entrada_blog }
      else
        format.html { render :new }
        format.json { render json: @entrada_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entrada_blogs/1
  # PATCH/PUT /entrada_blogs/1.json
  def update
    respond_to do |format|
      if @entrada_blog.update(entrada_blog_params)
        format.html { redirect_to @entrada_blog, notice: 'Entrada blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @entrada_blog }
      else
        format.html { render :edit }
        format.json { render json: @entrada_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrada_blogs/1
  # DELETE /entrada_blogs/1.json
  def destroy
    @entrada_blog.destroy
    respond_to do |format|
      format.html { redirect_to entrada_blogs_url, notice: 'Entrada blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrada_blog
      @entrada_blog = EntradaBlog.find(params[:id])

      @entrada_blogs_all = EntradaBlog.all

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entrada_blog_params
      params.require(:entrada_blog).permit(:titulo, :body, :otro1, :otro2, :image, tipo_contenido_attributes: [:astrofoto, :metematica])
      #params.require(:entrada_blog).permit(:titulo, :body, :imagen, :otro1, :otro2, :image, tipo_contenido_attributes: [:astrofoto, :metematica])

    end

    def authenticate
      authenticate_or_request_with_http_basic do |name, password|
      name == ENV["superuser_name"] && password == ENV["superuser_pass"]
      #ruta nuevo post: /entrada_blog/new
      #ruta editar post: /entrada_blog/5/edit
      #ruta resumen : /editablog
    end
  end
end
