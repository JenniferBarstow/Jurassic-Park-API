class CreateCage < ApplicationRecord
  has_many :dinosaurs
  has_many :species, through: :dinosaurs
end
