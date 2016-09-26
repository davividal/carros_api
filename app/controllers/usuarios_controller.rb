class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :update, :destroy]

  # GET /usuarios
  def index
    @usuarios = Usuario.all

    respond_to do |format|
      format.json { render json: @usuarios }
      format.xml { render xml: @usuarios }
    end
  end

  # GET /usuarios/1
  def show
    respond_to do |format|
      format.json { render json: @usuario }
      format.xml { render xml: @usuario }
    end
  end

  # POST /usuarios
  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      respond_to do |format|
        format.json { render json: @usuario, status: :created, location: @usuario }
        format.xml { render xml: @usuario, status: :created, location: @usuario }
      end
    else
      respond_to do |format|
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
        format.xml { render xml: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  def update
    if @usuario.update(usuario_params)
      respond_to do |format|
        format.json { render json: @usuario }
        format.xml { render xml: @usuario }
      end
    else
      respond_to do |format|
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
        format.xml { render xml: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  def destroy
    @usuario.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def usuario_params
      params.require(:usuario).permit(:nome, :login, :senha)
    end
end
