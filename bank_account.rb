# Bank Account Project: Wave 1
# by Jennie
# Dependency: Ruby money -- gem install money
require 'csv'
require 'money'
I18n.enforce_available_locales = false

module Bank

  class Account
    attr_reader :balance, :id, :owner, :open_date
    # Instantiation of object has optional parameters of balance and owner
    def initialize(id, balance, open_date, owner = nil)
      @owner = owner
      # Creates an ID of random numbers
      @id = id
      # Raises an error with a rescue for a negative initial balance
      if balance < 0
        begin
          raise ArgumentError.new("You may not create an account with a negative balance.")
        rescue
          puts "Setting balance to a default value of 0."
          @balance = 0
        end
      else
        @balance = balance
      end
    end

    def withdraw(amount)
      if @balance - amount < 0
        puts "You cannot withdraw more than your account balance."
      else
        puts "Starting balance: " + Money.new(@balance, "USD").format
        puts "Amount withdrawn: " + Money.new(amount, "USD").format
        @balance -= amount
        puts "Updated balance: " + Money.new(@balance, "USD").format
      end
      return @balance
    end

    def deposit(amount)
      puts "Starting balance: " + Money.new(@balance, "USD").format
      puts "Amount deposited: " + Money.new(amount, "USD").format
      @balance += amount
      puts "Updated balance: " + Money.new(@balance, "USD").format
      return @balance
    end

    def print_balance
      money = Money.new(@balance, "USD")
      puts "The current balance of this account is " + money.format
    end

    # Assign an owner to an account
    def assign_owner(owner)
      @owner = owner
    end

    def self.all
      # Create array from csv file
      csv_file = CSV.read("./support/accounts.csv")
      # Create empty array which will hold all the account objects
      accounts_array = []
      csv_file.each do |row|
        # Create an account object from each row in the csv file
        temp = Bank::Account.new(row[0].to_i, row[1].to_i, row[2])
        # Push account object to array of accounts
        accounts_array.push(temp)
      end
      return accounts_array
    end

    def self.find(id)
      # Create array from csv file
      csv_file = CSV.read("./support/accounts.csv")
      match = csv_file.find { |row| row[0].to_i == id }
      return Bank::Account.new(match[0].to_i, match[1].to_i, match[2])
    end

    # Create an ultimate array of relationships between accounts and owners
    def self.all_relationships
      # Create an empty array of account and owner relationships
      relationships = []
      # Read the accounts and owners relationship
      csv_file = CSV.read("./support/account_owners.csv")
      # For each account, find an owner and assign it to the Account
      csv_file.each do |row|
        temp_account = Bank::Account.find(row[0].to_i)
        temp_owner = Bank::Owner.find(row[1].to_i)
        temp_account.assign_owner(temp_owner)
        relationships.push(temp_account)
      end
      return relationships
    end

  end

  class Owner
    attr_reader :id, :first_name, :last_name, :address, :city, :state
    def initialize(owner_hash)
      @id = owner_hash[:id]
      @last_name = owner_hash[:last_name]
      @first_name = owner_hash[:first_name]
      @address = owner_hash[:address]
      @city = owner_hash[:city]
      @state = owner_hash[:state]
    end

    # Converts an array to a hash for passing to owner instantiation
    def self.convert_to_owner_hash(owner_array)
      owner_hash = {}
      owner_hash[:id] = owner_array[0].to_i
      owner_hash[:last_name] = owner_array[1]
      owner_hash[:first_name] = owner_array[2]
      owner_hash[:address] = owner_array[3]
      owner_hash[:city] = owner_array[4]
      owner_hash[:state] = owner_array[5]
      return owner_hash
    end

    def self.all
      csv_file = CSV.read("./support/owners.csv")
      # Create empty array which will hold all the account objects
      owners_array = []
      csv_file.each do |row|
        # Convert the array to a hash
        owner_hash = self.convert_to_owner_hash(row)
        # Create an account object from each row-hash in the csv file
        temp = Bank::Owner.new(owner_hash)
        # Push account object to array of accounts
        owners_array.push(temp)
      end
      return owners_array
    end

    def self.find(id)
      csv_file = CSV.read("./support/owners.csv")
      match = csv_file.find { |row| row[0].to_i == id }
      owner_hash = self.convert_to_owner_hash(match)
      return Bank::Owner.new(owner_hash)
    end
  end
end
