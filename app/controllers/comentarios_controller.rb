class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]
  before_action :set_tarea
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
    @comentario = Comentario.new(comentario_params)
    @comentario.usuario = current_usuario
    @comentario.tarea = @tarea
    respond_to do |format|
      if @comentario.save
        format.html { redirect_to @comentario.tarea, notice: 'Comentario was successfully created.' }
        format.json { render :show, status: :created, location: @comentario }
      else
        format.html { render :new }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
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

    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    def set_tarea
      @tarea = Tarea.find(params[:tarea_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_params
      params.require(:comentario).permit(:usuario_id, :tarea_id, :contenido)
    end
end
