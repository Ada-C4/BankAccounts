module Bank
  class Account
    attr_reader :balance # makes it so the user can only see their balance, not change it.
    def initialize(id, balance)
      @id = id
      @balance = balance
      raise ArgumentError.new("Permission Denied") if balance < 0
    end

# Once a new Owner is created, the variable holding the hash is passed in as 'person parameter'
    def assign_owner(person)
      @owner = person
      puts "#{@owner.name} owns this account"
    end

    def withdrawl(amnt_withdrawn)
      if amnt_withdrawn > @balance
        puts "You can't take out more than #{@balance}"
      else
      @balance = @balance - amnt_withdrawn # Return the updated account balance.
      puts "Your current balance is: #{@balance}" # The updated balance
      end
    end

    def deposit(amnt_deposited)
      @balance = @balance + amnt_deposited #Return the updated account balance.
      puts "Your current balance is: #{@balance}"
    end
  end

# Owner sets up the code to accept the important info in a hash. Feed info in irb.
  class Owner
    attr_reader :name, :address, :phone_number, :email
    def initialize(info)
      @name = info[:name]
      @address = info[:address]
      @phone_number = info[:phone_number]
      @email = info[:email]
    end
  end
end

info = {
    name: "Jenna",
    address: "2410 e pike",
    phone_number: 1235230683,
    email: "rmtolmach@gmail.com"
}
