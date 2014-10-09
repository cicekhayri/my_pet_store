class Pet < ActiveRecord::Base
  belongs_to :species
  validates :name, presence: true
end
