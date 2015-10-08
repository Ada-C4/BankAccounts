module Bank

class Owner
  attr_reader :first_name, :last_name, :street, :city, :state, :id

  def initialize(owner_hash)
    @id = owner_hash[:id]
    @first_name = owner_hash[:first_name]
    @last_name = owner_hash[:last_name]
    @street_address = owner_hash[:street_address]
    @city = owner_hash[:city]
    @state = owner_hash[:state]
  end

  # Method to display details of an owner instance
  def print_owner_details
    puts "The owner of this account is #{@first_name} #{@last_name}."
    puts "Street: #{@street_address}"
    puts "City: #{@city}"
    puts "State: #{@state}"
  end

  # Creates accounts from the accounts.csv file
  def self.all
    owner_hash = Hash.new
    @owners = []
    owners_csv = CSV.read("support/owners.csv")
    owners_csv.each do |id, last_name, first_name, street_address, city, state|
      owner_hash[:id] = id.to_i
      owner_hash[:last_name] = last_name
      owner_hash[:first_name] = first_name
      owner_hash[:street_address] = street_address
      owner_hash[:city] = city
      owner_hash[:state] = state
      id = Bank::Owner.new(owner_hash)
      @owners.push(id)
    end
    puts @owners
    return @owners
  end

  # Finds the owner with the ID that matches the passed parameter and returns the instance
  def self.find(id_search)
    found = @owners.find do |owner|
      owner.id == id_search
    end
    return found
  end


# ----------------------------------------- #
        # Work below is extra #

  # Displays (with formatting) the owner details for all the accounts in owners.csv
  def self.all_print_nice
    if @owners == nil
      puts "There are no accounts."
    else
      @owners.each do |owner|
        owner.print_owner_details
      end
    end
    return
  end

  # Finds an owner by id passed in as a parameter and displays the owner information nicely formatted
  def self.find_and_display(id_search)
    found = @owners.find do |owner|
      owner.id == id_search
    end
    return found.print_owner_details
  end

      # end of extra work #
# ----------------------------------------#

end

end
