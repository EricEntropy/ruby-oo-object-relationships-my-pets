class Owner
  #attr_accessor 
  attr_reader :name, :species
  @@owners = []

  def initialize(name)
    @name = name
    @species = "human"
    save
  end
  
  def save 
    @@owners << self
  end 

  def say_species
    return "I am a #{species}."
  end 

  def self.all
    @@owners
  end 

  def self.count 
    @@owners.length
  end 

  def self.reset_all
    @@owners.clear 
  end 

  def cats 
    Cat.all.select { |cat| cat.owner == self}
  end 

  def dogs 
    Dog.all.select { |dog| dog.owner == self}
  end
  
  def buy_cat(new_cat) 
    new_cat = Cat.new(new_cat, self)
  end 

  def buy_dog(new_dog) 
    new_dog = Dog.new(new_dog, self)
  end 

  def walk_dogs
    dogs.each { |dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each { |cat| cat.mood = "happy"}
  end 

  def sell_pets
    dogs.each { |dog| dog.mood = "nervous"}
    dogs.each { |dog| dog.owner = nil}
    cats.each { |cat| cat.mood = "nervous"}
    cats.each { |cat| cat.owner = nil}
  end 

  def list_pets
    dog_count = dogs.length 
    cat_count = cats.length
    return "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
  end 




end