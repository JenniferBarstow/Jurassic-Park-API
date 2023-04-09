class Api::V1::CagesController < ApplicationController

  def index
    if params[:power_status].present? && valid_power_status_query?(params[:power_status])
      filter_cages_by_power_status
    else
      @cages = Cage.all
    end

    if params[:power_status].present? && !valid_power_status_query?(params[:power_status])
      render json: { error: "Please enter a valid power status" }, status: :unprocessable_entity

    else
      render json: @cages.as_json(
        only: [:id, :name, :power_status],
        include: { dinosaurs: { only: [:name, :diet],
        include: { species: { only: [:name, :diet]} } } }
      ), status: :ok
    end
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
      only: [:id, :name, :power_status],
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
    params.require(:cage).permit(:name, :power_status)
  end

  def valid_power_status_query?(query)
    return true unless !["active", "down"].include?(query)
  end

  def filter_cages_by_power_status
    @cages = Cage.where(power_status: params[:power_status] )
  end
end
