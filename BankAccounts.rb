require 'chronic'
require 'csv'

module Bank

  class Account

    MIN_BALANCE = 0
    FEE = 0

    attr_reader :balance, :owner, :account_id

    def initialize(account_id, initial_balance, open_date) #min_balance = 0, fee = 0)
      @account_id = account_id.to_i
      #@min_balance = min_balance
      @balance = check_initial_balance(initial_balance.to_i)
      @open_date = Chronic.parse(open_date)
      #@fee = fee
    end

    def withdraw(amount)
      if amount <= @balance - self.class::MIN_BALANCE - self.class::FEE
        @balance -= (amount + self.class::FEE)
      else
        puts "Your balance is #{@balance}. You cannot withdraw #{amount} at this time."
        return @balance
      end
    end

    def deposit(amount)
        @balance += amount
    end

    def check_initial_balance(initial_balance)
      if initial_balance < self.class::MIN_BALANCE
        raise ArgumentError.new("Your initial balance must be more than #{self.class::MIN_BALANCE}!")
      else
        return initial_balance
      end
    end

    def self.all
      account_array = CSV.read("support/accounts.csv")

      account_array.map! do |account|
        Bank::Account.new(account[0],account[1],account[2])
      end
      return account_array
    end

    def self.find(id)
      Bank::Account.all.find do |account|
        account.account_id == id
      end
    end

    def self.add_relationships
    add_owner_array = CSV.read("support/account_owners.csv")
    accounts_with_owners = []

    add_owner_array.each do |key|
      account = Bank::Account.find(key[0].to_i)
      owner = Bank::Owner.find(key[1].to_i)
      account.add_owner(owner)
      accounts_with_owners.push(account)
      end
    return accounts_with_owners
    end

    def add_owner(owner)
      @owner = owner
    end

  end

  class Owner

    attr_reader :owner_id, :last_name, :first_name, :street_address, :city, :state

    def initialize(owner_id, last_name, first_name, street_address, city, state)
      @owner_id = owner_id.to_i
      @last_name = last_name
      @first_name = first_name
      @street_address = street_address
      @city = city
      @state = state
    end

    def self.all
      owner_array = CSV.read("support/owners.csv")

      owner_array.map! do |owner|
        Bank::Owner.new(owner[0],owner[1],owner[2],owner[3],owner[4], owner[5])
      end
      return owner_array
    end

    def self.find(id)
      Bank::Owner.all.find do |owner|
        owner.owner_id == id
      end
    end

  end

end
