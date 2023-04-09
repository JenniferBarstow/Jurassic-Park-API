require 'rails_helper'


require 'rails_helper'

RSpec.describe Dinosaur, type: :model do

  before(:each) do
    @cage = Cage.create(name: "Cage1")
    @cage_2 = Cage.create(name: "Cage2")
    @herbivore_species = Species.create(name: "Stegosaurus", diet: "herbivore")
    @carnivore_species = Species.create(name: "Tyrannosaurus Rex", diet: "carnivore")
    @carnivore_2_species = Species.create(name: "Velociraptor", diet: "carnivore")
  end

  describe "#validations" do

    context "when the dinosaur name is not present" do
      it "returns an error" do
        dino = Dinosaur.create(species: @herbivore_species, cage: @cage, diet: "herbivore")
        expect(dino.errors[:name]).to include("can't be blank")
      end
    end

    context "when the cage cannot contain carnivores" do
      it "returns an error if the dinosaur is a carnivore" do
        dino = Dinosaur.create(name: "Bruce", species: @herbivore_species, cage: @cage, diet: "herbivore")
        dino2 = Dinosaur.create(name: "Stego", species: @herbivore_species, cage: @cage_2, diet: "carnivore")
        dino2.update(cage: @cage)
        dino2.reload
        expect(dino2.errors[:cage_id]).to include("herbivores and carnivores cannot be in the same cage")
      end
    end
  end

  describe "#set_diet" do
    context "when the dinosaur species is carnivorous" do
      it "sets the dinosaur diet to carnivore" do
        dino = Dinosaur.create(name: "Dino1", species: @carnivore_species, cage: @cage, diet: "diet that doesnt match species diet")
        expect(dino.reload.diet).to eq("carnivore")
      end
    end

    context "when the dinosaur species is herbivorous" do
      it "sets the dinosaur diet to herbivore" do
        dino = Dinosaur.create(name: "Trina", species: @herbivore_species, cage: @cage, diet: "diet that doesnt match species diet")
        expect(dino.reload.diet).to eq("herbivore")
      end
    end
  end
end

