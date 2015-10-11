require 'csv'
# require "./support/accounts.csv"

module Bank

  class Account
    attr_reader :balance, :owner, :account_id, :owner_id

    MIN_BALANCE = 0
    WITHDRAWAL_FEE = 0

    def initialize (id, initial_balance, open_date)
      @account_id = id
      raise ArgumentError.new("That's not enough money to start your account.") if initial_balance <= self.class::MIN_BALANCE
      @balance = initial_balance # in cents
      open_date = open_date.to_s
      @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %z")
    end

    # Return an array of all Account instances in account.csv
    def self.all
      account_array = []
      CSV.read("./support/accounts.csv").each do |row|
        account = Bank::Account.new(row[0].to_i, row[1].to_i, row[2])
        account_array.push(account)
      end
      return account_array
    end

    # returns an instance of Account where the value of the id field in the CSV matches the passed parameter
    def self.find(id)
      self.all.find {|account| account.account_id == id}
    end

    def self.account_owners(account_id)
      account = self.all.find{|account| account.account_id == account_id}
      match_array = []
      CSV.read("./support/account_owners.csv").each do |row|
        array = [row[0].to_i, row[1].to_i]
        match_array.push(array)
      end
      match = match_array.find{|set| set[0] == account.account_id}
      @owner = Bank::Owner.all.find{|owner| match[1] == owner.owner_id}
    end

    # Withdraw money. Cannot withdraw to make account negative.
    def withdraw(amount)
      new_balance = @balance - amount
      if amount < 0
        puts "You can't withdraw a negative amount."
      elsif new_balance < self.class::MIN_BALANCE
        puts "You don't have that much money. You can withdraw up to #{@balance - self.class::MIN_BALANCE - self.class::WITHDRAWAL_FEE} cents."
      else
        @balance = new_balance - self.class::WITHDRAWAL_FEE
        return @balance
      end
    end


    # Deposit money, making sure you aren't depositing a negative amount
    #Return updated balance
    def deposit(amount)
      if amount < 0
        puts "You can't deposit a negative amount."
      else
        @balance += amount
        return @balance
      end
    end

  end

  class Owner
    attr_reader :first_name, :last_name, :street_address, :city, :state, :owner_id

    def initialize(owner_id, last_name, first_name, street_address, city, state)
      @owner_id = owner_id
      @last_name = last_name
      @first_name = first_name
      @street_address = street_address
      @city = city
      @state = state
    end

    # returns a collection of Owner instances, representing all of the Owners described in the CSV.
    def self.all
      owner_array = []
      CSV.read("./support/owners.csv").each do |row|
        owner = Bank::Owner.new(row[0].to_i, row[1], row[2], row[3], row[4], row[5])
        owner_array.push(owner)
      end
      return owner_array
    end

    def self.find(owner_id)
      self.all.find {|owner| owner.owner_id == owner_id }
    end

  end

end
