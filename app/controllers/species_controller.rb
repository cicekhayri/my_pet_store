class SpeciesController < ApplicationController
  def index
    @species = Species.all
  end

  def new
    @species = Species.new
    @species.pets.build
  end

  def create
    @species = Species.new(species_params)

    if @species.save
      redirect_to species_index_path
    else
      render :new
    end
  end

  private
  def species_params
    params.require(:species).permit(:species_type, pets_attributes: [:id, :name])
  end
end
