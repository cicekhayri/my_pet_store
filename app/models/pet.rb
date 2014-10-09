class Pet < ActiveRecord::Base
  belongs_to :species
  validates :name, presence: true
  
  # for uploading image
  mount_uploader :picture, PetPictureUploader 
end
