class Dinosaur < ApplicationRecord
  belongs_to :cage
  belongs_to :species
  
  validates :name, presence: true

  before_save :set_diet

  def set_diet
    self.diet = species.diet
  end

  def carnivore?
    diet == "carnivore"
  end

  def herbivore?
    diet == "herbivore"
  end
end
