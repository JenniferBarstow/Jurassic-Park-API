class Dinosaur < ApplicationRecord
  belongs_to :cage
  belongs_to :species
  
  validates :name, presence: true
  validate :carnivores_herbivore_separation
  validate :carnivore_species_match

  before_save :set_diet

  validate :cage_power_status_check

  def cage_power_status_check
    c = Cage.find(cage_id)
    errors.add(:cage_id, "cannot contain dinosaurs when power is down") if c.present? && c.power_status == 'down'
  end

  def set_diet
    self.diet = species.diet
  end

  def carnivore?
    diet == "carnivore"
  end

  def herbivore?
    diet == "herbivore"
  end

  def cage_mates_species
    return [] unless cage_id

    Cage.includes(:dinosaurs)
        .where(id: cage_id)
        .pluck("dinosaurs.species_id")
        .flatten
        .uniq
  end

  def carnivores_herbivore_separation
    if herbivore? && Cage.find(cage_id).can_contain_carnivores? 
      errors.add(:cage_id, "herbivores and carnivores cannot be in the same cage")
    end
  end

  def carnivore_species_match
    species = Species.find(species_id).name

    return unless carnivore? || !cage_mates_species.empty? && cage_mates_species.include?(species)

    c = Cage.find(cage_id)
    if c.carnivore_cage_species == false ||
      !c.carnivore_cage_species.empty? && (c.carnivore_cage_species != species)
        errors.add(:cage_id, "Carnivores can only be in a cage with other dinosaurs of the same species.")
    end
  end
end
