class PetsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :destroy, :edit]
  def index
    @pets = Pet.order(id: :desc)
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    
    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

  private
  def pet_params
    params.require(:pet).permit(:name)
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end

end
