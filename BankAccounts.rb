module Bank
  class Account
    attr_reader :balance, :owner, :id
    def initialize(owner, balance = 0)
      @id = rand(1000000)
      @balance = balance
      if balance < 0
        raise ArgumentError, "Not a valid initial balance!"
      end
      @owner = owner
    end
    def withdraw(amount)
      if amount > @balance
        puts "Not enough fundz!"
      else
        @balance = @balance - amount
      end
      return @balance
    end
    def deposit(amount)
      @balance = @balance + amount
    end
  end
  class Owner
    attr_reader :id, :first, :last, :street_address, :city, :state, :zip
    def initialize(owner_info)
      @id = rand(1000000)
      @first = owner_info[:first]
      @last = owner_info[:last]
      @street_address = owner_info[:street_address]
      @city = owner_info[:city]
      @state = owner_info[:state]
      @zip = owner_info[:zip]
    end
  end
end

owner_info = {first: "Kelly", last: "Devlin", street_address: "4538 46th Ave SW", city: "Seattle",
              state: "WA", zip: "98116"}
owner = Bank::Owner.new(owner_info)
account = Bank::Account.new(owner)
puts "Account ##{account.id} is owned by #{account.owner.first} #{account.owner.last} (owner id##{account.owner.id})."
