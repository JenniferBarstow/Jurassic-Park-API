class Api::V1::SpeciesController < ApplicationController

  def index
    @species = Species.all
    render json: @species, status: :ok
  end


  def create
    @species = Species.create(species_params)
    if @species.save
      render json: @species, status: :created
    else
      render json: { errors: @species.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def show
    render json: @species, status: :ok
  end


  def update
    if @species.update(species_params)
      render json: @species, status: :ok
    else
      render json: { errors: @species.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def destroy
    @species.destroy
    head :no_content
  end

  private

  def species_params
    params.require(:species).permit(:name, :diet)
  end

end
