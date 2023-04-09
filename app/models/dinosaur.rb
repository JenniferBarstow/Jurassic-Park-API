class Dinosaur < ApplicationRecord
  belongs_to :cage
  belongs_to :species
  
  validates :name, presence: true
end
