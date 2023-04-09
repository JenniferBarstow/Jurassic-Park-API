tyrannosaurus_cage = Cage.find_or_create_by(name: "Tough Guys")
second_tyrannosaurus_cage = Cage.find_or_create_by(name: "Tough Guys Part 2")
raptors_cage = Cage.find_or_create_by(name: "Rapture Buds")
spinosaurus_cage = Cage.find_or_create_by(name: "Spino Dinos")
megalosaurus_cage = Cage.find_or_create_by(name: "Mega Dinos")

herbivores_cage_1 = Cage.find_or_create_by(name: "Plant Dinos")
herbivores_cage_2 = Cage.find_or_create_by(name: "Herb Dinos")

species = [
  { name: 'Tyrannosaurus', diet: "carnivore" },
  { name: 'Velociraptor', diet: "carnivore"  },
  { name: 'Spinosaurus', diet: "carnivore"  },
  { name: 'Megalosaurus', diet: "carnivore"  },
  { name: 'Brachiosaurus', diet: "herbivore"  },
  { name: 'Stegosaurus', diet: "herbivore"  },
  { name: 'Ankylosaurus', diet: "herbivore" },
  { name: 'Triceratops', diet: "herbivore" }
]

species.each do |s| Species.find_or_create_by(s) end

 dinosaurs = [
  { name: 'Teddy', diet: "carnivore", species: Species.find(1), cage_id: tyrannosaurus_cage.id} ,
  { name: 'Stanley', diet: "carnivore", species: Species.find(1), cage_id: tyrannosaurus_cage.id },
  { name: 'Wes', diet: "carnivore", species: Species.find(2), cage_id: raptors_cage.id  },
  { name: 'Blue', diet: "carnivore", species: Species.find(2), cage_id: raptors_cage.id },
  { name: 'Freya', diet: "carnivore", species: Species.find(3), cage_id: spinosaurus_cage.id},
  { name: 'Emmy', diet: "carnivore", species: Species.find(3), cage_id: spinosaurus_cage.id},
  { name: 'Lou', diet: "carnivore", species: Species.find(4), cage_id: megalosaurus_cage.id },
  { name: 'Bruce Wayne', diet: "carnivore", species: Species.find(4), cage_id: megalosaurus_cage.id },
  { name: 'Charlie', diet: "herbivore", species: Species.find(5), cage_id: herbivores_cage_1.id} ,
  { name: 'Peter', diet: "herbivore", species: Species.find(5), cage_id: herbivores_cage_1.id },
  { name: 'Parker', diet: "herbivore", species: Species.find(6), cage_id: herbivores_cage_1.id  },
  { name: 'Apollo', diet: "herbivore", species: Species.find(6), cage_id: herbivores_cage_1.id },
  { name: 'Creed', diet: "herbivore", species: Species.find(7), cage_id: herbivores_cage_2.id },
  { name: 'Rocky', diet: "herbivore", species: Species.find(7), cage_id: herbivores_cage_2.id },
  { name: 'Balboa', diet: "herbivore", species: Species.find(8), cage_id: herbivores_cage_2.id },
  { name: 'Tina', diet: "herbivore", species: Species.find(8), cage_id: herbivores_cage_2.id }
 ] 
 
 dinosaurs.each do |d| Dinosaur.find_or_create_by(d) end
