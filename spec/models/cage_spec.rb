require 'rails_helper'

RSpec.describe Cage, type: :model do
  describe  "#carnivore_cage_species" do

    context "when the cage has no dinosaurs" do
      it "returns an empty array" do
        cage = Cage.create
        expect(cage.carnivore_cage_species).to eq([])
      end
    end

    context "when the cage has only herbivore dinosaurs" do
      it "returns false" do
        cage = Cage.create
        species1 = Species.create(name: "Stegosaurus", diet: "herbivore")
        species2 = Species.create(name: "Brachiosaurus", diet: "herbivore")
        cage.dinosaurs.create(name: "Dino1", species: species1, diet: "herbivore")
        cage.dinosaurs.create(name: "Dino2", species: species2, diet: "herbivore")
        expect(cage.carnivore_cage_species).to eq(false)
      end
    end

    context "when the cage has at least one carnivore dinosaur" do
      it "returns a string with the names of the carnivore species" do
        cage = Cage.create
        species1 = Species.create(name: "Tyrannosaurus Rex", diet: "carnivore")
        cage.dinosaurs.create(name: "Dino1", species: species1, diet: "carnivore")
        cage.dinosaurs.create(name: "Dino2", species: species1, diet: "carnivore")
        expect(cage.carnivore_cage_species).to eq("Tyrannosaurus Rex")
      end
    end
  end

  describe "#can_contain_carnivores" do

    context "when the cage has no dinosaurs" do
      it "returns true" do
        cage = Cage.create
        expect(cage.can_contain_carnivores?).to eq(true)
      end
    end

    context "when the cage has only herbivore dinosaurs" do
      it "returns false" do
        cage = Cage.create
        species1 = Species.create(name: "Brachiosaurus", diet: "herbivore")
        species2 = Species.create(name: "Stegosaurus", diet: "herbivore")
        cage.dinosaurs.create(name: "Dino1", species: species1, diet: "herbivore")
        cage.dinosaurs.create(name: "Dino2", species: species2, diet: "herbivore")
        expect(cage.can_contain_carnivores?).to eq(false)
      end
    end

    context "when the cage has at least one carnivore dinosaur" do
      it "returns true" do
        cage = Cage.create
        species1 = Species.create(name: "Tyrannosaurus Rex", diet: "carnivore")
        cage.dinosaurs.create(name: "Dino1", species: species1, diet: "carnivore")
        expect(cage.can_contain_carnivores?).to eq(true)
      end
    end
  end
end
