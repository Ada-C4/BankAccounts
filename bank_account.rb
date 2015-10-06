# Bank Account Project: Wave 1
# by Jennie
# Dependency: Ruby money -- gem install money
require 'money'
I18n.enforce_available_locales = false

module Bank

  class Account
    attr_reader :balance, :id, :owner
    # Instantiation of object has optional parameters of balance and owner
    def initialize(balance = 0, owner = nil)
      @owner = owner
      # Creates an ID of random numbers
      @id = ('0'..'9').to_a.shuffle[0..8].join
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
