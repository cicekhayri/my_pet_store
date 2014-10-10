class PetsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :destroy, :update, :edit]
  before_filter :find_pet, only: [:show, :edit, :update, :buy_pet]

  def index
    @pets = Pet.order(id: :desc)
  end

  def new
    @pet = Pet.new
  end

  def show
  end

  def edit
  end

  def create
    @pet = Pet.new(pet_params)
    
    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

  def update
    if @pet.update_attributes(pet_params)
      redirect_to pet_path
    else
      render :edit
    end
  end

  def buy_pet

    if current_user
      @pet.update_attributes({user_id: current_user.id})
      redirect_to pet_path
    else
      render :buy_pet
    end
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :weight, :picture, :species_id)
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end

end
