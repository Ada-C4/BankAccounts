require "./bankv2.rb"

class Owner < Bank::Account

  attr_reader :first_name, :last_name, :street_1, :street_2, :city, :state, :zip, :ssn

  def initialize(owner_hash)
    @first_name = owner_hash[:first_name]
    @last_name = owner_hash[:last_name]
    @street_1 = owner_hash[:street_1]
    @street_2 = owner_hash[:street_2]
    @city = owner_hash[:city]
    @state = owner_hash[:state]
    @zip = owner_hash[:zip]
    @ssn = owner_hash[:ssn]
    @owner = []
  end

  def add_new_owner(owner)
    @owner.push(owner)
  end

  def print_info
    puts "#{@first_name} #{@last_name} is the owner of this account, from #{@city}, #{@state}."
  end
end

ruth = {

  first_name: "Ruth",
  last_name: "Bader Ginsburg",
  street_1: "Supreme Court",
  street_2: "Important Road",
  city: "Washington",
  state: "DC",
  zip: "12121",
  ssn: "1234567",
}

ruth = Bank::Account.new(1212, 300000, "12/3/5")

ruth.add_new_owner(Owner.new(ruth))

# s.add_new_planet(Planet.new(fremont))

# name = Bank::Owner.new({first_name: "Sarah", zip: "98933"})
