require("pry")
require_relative("models/bounty.rb")


bounty1 = Bounty.new(
  {
    'name' => 'Han Solo',
    'species' => 'human',
    'bounty_value' => 50000,
    'danger_level' => 'high',
    'last_known_location' => 'Starkiller Base',
    'homeworld' => 'Corellia',
    'favourite_weapon' => 'blaster pistol',
    'cashed_in' => true,
    'collected_by' => 'Bobba Fett'
  }
)

bounty2 = Bounty.new(
  {
    'name' => 'Luke Skywalker',
    'species' => 'human',
    'bounty_value' => 150000,
    'danger_level' => 'ermagerdyerderd',
    'last_known_location' => 'Endor',
    'homeworld' => 'Tatooine',
    'favourite_weapon' => 'lightsaber',
    'cashed_in' => false
  }
)

# bounty1.save()
bounty2.save()
result = Bounty.find_by_name('Han Solo')

binding.pry()
nil
