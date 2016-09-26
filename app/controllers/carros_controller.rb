class CarrosController < ApplicationController
  before_action :set_carro, only: [:show, :update, :destroy]

  # GET /carros
  def index
    @carros = Carro.all

    respond_to do |format|
      format.json { render json: @carros }
      format.xml { render xml: @carros }
    end
  end

  # GET /carros/1
  def show
    render json: @carro
  end

  # POST /carros
  def create
    @carro = Carro.new(carro_params)

    if @carro.save
      respond_to do |format|
        format.json { render json: @carro, status: :created, location: @carro }
        format.xml { render xml: @carro, status: :created, location: @carro }
      end
    else
      respond_to do |format|
        format.json { render json: @carro.errors, status: :unprocessable_entity }
        format.xml { render xml: @carro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carros/1
  def update
    if @carro.update(carro_params)
      respond_to do |format|
        format.json { render json: @carro }
        format.xml { render xml: @carro }
      end
      else
      respond_to do |format|
        format.json { render json: @carro.errors, status: :unprocessable_entity }
        format.xml { render xml: @carro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carros/1
  def destroy
    @carro.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carro
      @carro = Carro.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def carro_params
      params.require(:carro).permit(:nome, :ano)
    end
end
