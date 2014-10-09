class SpeciesController < ApplicationController
  before_filter :authorize
  before_filter :find_species, only: [:show, :destroy, :edit, :update]
  def index
    @species = Species.all
  end

  def new
    @species = Species.new
    @species.pets.build
  end

  def show
  end

  def edit
  end

  def create
    @species = Species.new(species_params)

    if @species.save
      redirect_to species_index_path
    else
      render :new
    end
  end

  def update
    if @species.update_attributes(species_params)
      redirect_to species_path
    else
      render :edit
    end
  end

  def destroy
    @species.destroy
    redirect_to species_index_path
  end

  private
  def species_params
    params.require(:species).permit(:species_type, :stock) #pets_attributes: [:id, :name])
  end

  def find_species
    @species = Species.find(params[:id])
  end
end
