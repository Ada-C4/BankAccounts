module Bank
  class Account
    require 'csv' #is this in the right place?

    attr_reader :id, :balance, :open_date # makes it so the user can only see their balance, not change it.
    def initialize(id, balance, open_date)
      @id = id
      @balance = balance
      @open_date  = open_date
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
        return @balance
      else
      @balance = @balance - amnt_withdrawn # Return the updated account balance.
      puts "Your current balance is: #{@balance}" # The updated balance
      end
      return @balance
    end

    def deposit(amnt_deposited)
      @balance = @balance + amnt_deposited #Return the updated account balance.
      puts "Your current balance is: #{@balance}"
      return @balance
    end

# This method returns all of the accounts in one array as Account instances.
    def self.all
      # reads the csv and puts it in an array.
      @csv_info = CSV.read("./support/accounts.csv")
      # Makes an empty array
      account_all = []
      # goes through each array
      @csv_info.each do |l|
        # Creates a new instance of an Account and pushes the info from
        # index 0..2 into my empty array.
        account_all.push(Account.new(l[0], l[1], l[2]))
      end
      # Prints the new array.
      account_all
    end

# This method takes in an ID
    def self.find(id)
      # 'self' contains the account_all information. I use the find method to
      # go through each thing in the aray...
      self.all.find do |a|
        # ...and checks to see if anything in the array equals the id passed in.
        a.id.to_i == id
      end
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
