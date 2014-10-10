class Pet < ActiveRecord::Base
  belongs_to :species
  belongs_to :user
  validates :name, presence: true
  
  # for uploading image
  mount_uploader :picture, PetPictureUploader 
end
