class Api::V1::CagesController < ApplicationController

  def index
    @cages = Cage.all
    render json: @cages.as_json(
      only: [:id, :name],
      include: { dinosaurs: { only: [:name, :diet],
      include: { species: { only: [:name, :diet]} } } }
    ), status: :ok
  end

  def create
    @cage = Cage.create(cage_params)
    if @cage.save
      render json: @cage, status: :created
    else
      render json: { errors: @cage.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @cage = Cage.find(params[:id])
    render json: @cage.as_json(
      only: [:id, :name],
      include: { dinosaurs: { only: [:name, :diet],
      include: { species: { only: [:name, :diet]} } } }
    ), status: :ok
  end
    
  def update
    @cage = Cage.find(params[:id])
    if @cage.update(cage_params)
      render json: @cage, status: :ok
    else
      render json: { errors: @cage.errors.full_messages }, status: :unprocessable_entity
    end
  end
    
  def destroy
    @cage = Cage.find(params[:id])
    @cage.destroy
    head :no_content
  end
    
  private
    
  def cage_params
    params.require(:cage).permit(:name)
  end    
end
