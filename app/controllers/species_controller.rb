class SpeciesController < ApplicationController
  before_filter :authorize
  before_filter :find_species, only: [:show, :destroy]
  def index
    @species = Species.all
  end

  def new
    @species = Species.new
    @species.pets.build
  end

  def show
  end

  def create
    @species = Species.new(species_params)

    if @species.save
      redirect_to species_index_path
    else
      render :new
    end
  end

  def destroy
    @species.destroy
    redirect_to species_index_path
  end

  private
  def species_params
    params.require(:species).permit(:species_type) #pets_attributes: [:id, :name])
  end

  def find_species
    @species = Species.find(params[:id])
  end
end
