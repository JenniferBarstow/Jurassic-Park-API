class Cage < ApplicationRecord
  has_many :dinosaurs
  has_many :species, through: :dinosaurs

  def can_contain_carnivores?
    return true if dinosaurs.empty?
    dinosaurs.all?(&:carnivore?)
  end
end
