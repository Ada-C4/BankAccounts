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

    def formatted_name
      return @owner.first_name + " " + @owner.last_name
    end

    def assign_owner(owner)
      @owner = owner
      puts "The new owner of account ##{id} is #{formatted_name}"
    end

    def self.all
      # Create array from csv file
      csv_file = CSV.read("./support/accounts.csv")
      # Create empty array which will hold all the account objects
      accounts_array = []
      csv_file.each do |row|
        # Create an account object from each row in the csv file
        temp = Bank::Account.new(row[0], row[1].to_i, row[2])
        # Push account object to array of accounts
        accounts_array.push(temp)
      end
      return accounts_array
    end

    def self.find(id)
      accounts = self.all
      match = accounts.find { |account| account.id == id }
      return match
    end

  end

  class Owner
    attr_reader :first_name, :last_name, :address1, :address2, :city, :state, :zip
    def initialize(person_hash)
      @first_name = person_hash[:first_name]
      @last_name = person_hash[:last_name]
      @address1 = person_hash[:address1]
      @address2 = person_hash[:address2]
      @city = person_hash[:city]
      @state = person_hash[:state]
      @zip = person_hash[:zip]
    end

  end

end
