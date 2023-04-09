class Api::V1::DinosaursController < ApplicationController

  def index
    @dinosaurs = Dinosaur.all
    render json: @dinosaurs, status: :ok
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
    render json: @dinosaur, status: :ok
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
  
  def dinosaur_params
    params.require(:dinosaur).permit(:name, :species_id, :diet, :cage_id)
  end

end
