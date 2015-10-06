# Bank Account Project: Wave 1
# by Jennie
require 'money'
I18n.enforce_available_locales = false

module Bank

  class Account
    attr_reader :balance, :id

    def initialize(balance = 0)
      # Creates an ID of random numbers
      @id = ('0'..'9').to_a.shuffle[0..8].join
      if balance < 0
        raise ArgumentError.new("You may not create an account with a negative balance.")
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

  end

  class Owner
    def initialize
    end
  end

end
