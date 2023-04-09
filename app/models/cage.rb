class Cage < ApplicationRecord
  has_many :dinosaurs
  has_many :species, through: :dinosaurs

  enum power_status: { active: 'active', down: 'down' }

  validate :power_status_check

  def power_status_check
    errors.add(:cage_id, "cannot be powered down when it contains dinosaurs") if !dinosaurs.empty? && power_status == 'down'
  end


  def can_contain_carnivores?
    return true if dinosaurs.empty?
    dinosaurs.all?(&:carnivore?)
  end

  def carnivore_cage_species
    return [] if dinosaurs.empty?
    dinosaurs.any? { |dinosaur| dinosaur.carnivore? } && dinosaurs.map(&:species).pluck(:name).uniq.join(',') 
  end
end
