class Cage < ApplicationRecord
  has_many :dinosaurs
  has_many :species, through: :dinosaurs

  def can_contain_carnivores?
    return true if dinosaurs.empty?
    dinosaurs.all?(&:carnivore?)
  end

  def carnivore_cage_species
    return [] if dinosaurs.empty?
    dinosaurs.any? { |dinosaur| dinosaur.carnivore? } && dinosaurs.map(&:species).pluck(:name).uniq.join(',') 
  end
end
