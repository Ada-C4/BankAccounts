# figure out how to add to Bank module


class Owner
  attr_reader :first_name, :last_name, :street_address, :owner_id

  def initialize(owner_id, last_name, first_name, street_address, city, state)
    @owner_id = id
    @first_name = first_name
    @last_name = last_name
    @street_address = street_address
    @city = city
    @state = state
  end

  def self.all
    all_owners = []

    CSV.read("./support/owners.csv").each do |line|
      y = Bank::Owner.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5])
      all_owners.push(y)
    end

    return all_owners
  end

  def self.find(id)
    Bank::Owner.all.find do |account_instance|
      account_instance.owner_id == id
    end
  end
end
