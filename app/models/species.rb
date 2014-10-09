class Species < ActiveRecord::Base
  has_many :pets
  accepts_nested_attributes_for :pets
end
