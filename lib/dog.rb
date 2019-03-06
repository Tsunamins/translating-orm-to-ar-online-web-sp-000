

class Dog < ActiveRecord::Base
  attr_accessor :name, :breed
  
   def initialize(name:, breed:)
    @name = name 
    @breed = breed 
    
    
  end
  
  def self.create(name:, breed:)
    dog = Dog.new(name: name, breed: breed)
    dog.save
    dog
  end
  
  def save
    sql = "INSERT INTO dogs (name, breed) VALUES = (?, ?)"
   
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
  end 
  
  def update
    sql = "UPDATE dogs SET name = ?, breed = ?  WHERE id = ?"
    DB[:conn].execute(sql, self.name, self.breed, self.id)
  end
  
   
  
  
  
end
