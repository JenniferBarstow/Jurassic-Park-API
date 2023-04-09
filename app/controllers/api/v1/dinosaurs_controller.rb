
class Api::V1::DinosaursController < ApplicationController

  def index
    if params[:species].present? && valid_species_query?(params[:species])
      filter_dinos_by_species_name

    elsif params[:cage].present? && valid_cage_query?(params[:cage])
      filter_dinos_by_cage_name

    else
      @dinosaurs = Dinosaur.all
    end

    if params[:species].present? && !valid_species_query?(params[:species])
      render json: { error: "Please enter a valid species name" }, status: :unprocessable_entity

    elsif params[:cage].present? && !valid_cage_query?(params[:cage])
      render json: { error: "Please enter a valid cage name" }, status: :unprocessable_entity
    else
      render json: @dinosaurs.to_json(only: [:id, :name, :diet], include: { cage: { only: :name },species: { only: :name } }), status: :ok
    end
  end


  def create
    @dinosaur = Dinosaur.create(dinosaur_params)
    if @dinosaur.save
      render json: @dinosaur, status: :created
    else
      render json: { errors: @dinosaur.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @dinosaur = Dinosaur.find(params[:id])
    render json: @dinosaur.to_json(
      only: [:id, :name, :diet],
      include: { cage: { only: :name }, species: { only: :name } }
      ), status: :ok
  end


  def update
    @dinosaur = Dinosaur.find(params[:id])
    if @dinosaur.update(dinosaur_params)
      render json: @dinosaur, status: :ok
    else
      render json: { errors: @dinosaur.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def destroy
    @dinosaur = Dinosaur.find(params[:id])
    @dinosaur.destroy
    head :no_content
  end

  private

  def filter_dinos_by_cage_name
    @cage = Cage.find_by(name: params[:cage])
    @dinosaurs = Dinosaur.joins(:cage).where(cage: { name: @cage.name })
  end

  def filter_dinos_by_species_name
    @species = Species.find_by(name: params[:species])
    @dinosaurs = Dinosaur.joins(:species).where(species: { name: @species.name })
  end

  def valid_species_query?(query)
    return true unless !Species.all.map(&:name).include?(query)
  end

  def valid_cage_query?(query)
    return true unless !Cage.all.map(&:name).include?(query)
  end

  def dinosaur_params
    params.require(:dinosaur).permit(:name, :species_id, :diet, :cage_id)
  end
end
