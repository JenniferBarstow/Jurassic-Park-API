class Dinosaur < ApplicationRecord
  belongs_to :cage
  belongs_to :species
  
  validates :name, presence: true
  validate :carnivores_herbivore_separation

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

  def carnivores_herbivore_separation
    if herbivore? && Cage.find(cage_id).can_contain_carnivores? 
      errors.add(:cage_id, "herbivores and carnivores cannot be in the same cage")
    end
  end
end
