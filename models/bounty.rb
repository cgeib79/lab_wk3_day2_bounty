require('pg')

class Bounty

  attr_reader :id

  attr_accessor :last_known_location

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value']
    @danger_level = options['danger_level']
    @last_known_location = options['last_known_location']
    @homeworld = options['homeworld']
    @favourite_weapon = options['favourite_weapon'],
    @cashed_in = options['cashed_in']
    @collected_by = options['collected_by']
  end

  def save()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "INSERT INTO bounties (name, species, bounty_value, danger_level, last_known_location, homeworld, favourite_weapon, cashed_in, collected_by) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id
    "
    values = [@name, @species, @bounty_value, @danger_level, @last_known_location, @homeworld, @favourite_weapon, @cashed_in, @collected_by]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    @id = result [0] ['id'].to_i()
    db.close()
  end

  def update()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "UPDATE bounties SET (name, species, bounty_value, danger_level, last_known_location, homeworld, favourite_weapon, cashed_in, collected_by) = ($1, $2, $3, $4, $5, $6, $7, $8, $9) WHERE id = $10
    "
    values = [@name, @species, @bounty_value, @danger_level, @last_known_location, @homeworld, @favourite_weapon, @cashed_in, @collected_by, @id]
    db.prepare("update", sql)
    result = db.exec_prepared("update", values)
    db.close()
  end

  def delete()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "DELETE FROM bounties WHERE id = $1"
    values =[@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close()
  end

  def Bounty.find_by_name(name) #populated bracket means it needs to accept item
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "SELECT * FROM bounties WHERE name = $1"
    values = [name]
    db.prepare("find_by_name", sql)
    result = db.exec_prepared("find_by_name", values)
    db.close()
  end

end
