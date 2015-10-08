#WELCOME TO THE BANK OF LAUREN
#
require "csv"

# Create a `Bank` module which will contain your `Account` class and any future bank account logic.
module Bank

# Create an `Account` class which should have the following functionality:
  class Account

    @@number_of_accounts = 0

# - Should be able to access the current `balance` of an account at any time.

  attr_reader :balance

# - A new account should be created with an ID and an initial balance
    def initialize
      array_of_accounts = CSV.read("./support/accounts.csv")
      @account_num = array_of_accounts[@@number_of_accounts][0]
      initial_deposit = array_of_accounts[@@number_of_accounts][1]
      @balance = open_deposit_check(initial_deposit.to_i)
      @open_date = array_of_accounts[@@number_of_accounts][2]
      @@number_of_accounts += 1
    end

    #self.all - returns a collection of Account instances, representing all of the Accounts described in the CSV. See below for the CSV file specifications

    def self.all
      @all_acts_array = []
      begin_count = @@number_of_accounts
      array_of_accounts = CSV.read("./support/accounts.csv")
      while @@number_of_accounts < (array_of_accounts.length + begin_count) do
        @all_acts_array.push(Account.new)
      end
      return @all_acts_array
    end

     #self.find(id) - returns an instance of `Account` where the value of the id field in the CSV matches the passed parameter

    def self.find(id)
      @all_acts_array.find do |x|
        x = id
      end
    end

# ### Error handling
# - A new account cannot be created with initial negative balance - this will `raise` an `ArgumentError` (Google this)
  # begin
    def open_deposit_check(initial_deposit)
    transacting = true
    while transacting do
      if initial_deposit <= 0
        raise Exception.new("New accounts must be opened with a positive balance.")
      else
        transacting = false
      end
      return initial_deposit.to_i
    end
  end

# - Should have a `withdraw` method that accepts a single parameter which represents the amount of money that will be withdrawn. This method should return the updated account balance.
    def withdraw (withdraw_amount)
      transacting = true
      while transacting do
        withdraw_check = withdraw_amount
        if withdraw_check < 0
          puts "You cannot withdaw #{withdraw_amount}. Your account currently have a blance of #{@balance}."
          print "Would you like to withdaw a differnt amount? "
          diff_amount = gets.chomp.downcase
            if diff_amount == "yes" || diff_amount == "y"
              puts "How much would you like to withdraw? "
              withdraw_amount = gets.chomp.to_i
              transacting = true
            else
              transacting = false
            end
        else
          balance_before = @balance
          @balance = @balance - withdraw_check
          puts "Your balance was #{balance_before}. You have withdrawn #{withdraw_amount}. Your balance is now #{@balance}."
          transacting = false
        end
      end
    end

# - Should have a `deposit` method that accepts a single parameter which represents the amount of money that will be deposited.
  def deposit(deposit_amount)
    transacting = true
    deposit_amount = deposit_amount.to_i
    while transacting do
      if deposit_amount < 0
        puts "You cannot deposit a negative amount."
        print "Would you like to withdaw instead?  "
        withdraw_instead = gets.chomp.downcase
          if withdraw_instead == "yes" || withdraw_instead == "y"
            print "How much would you like to withdraw?  "
            amount = gets.chomp.to_i
            withdraw(amount)
            transacting = false
          else
            print "Would you like to deposit a differnt amount?  "
            diff_deposit = gets.chomp.downcase
            if diff_deposit == "yes" || diff_deposit == "y"
              transacting = true
              print "How much would you like to deposit?  "
              deposit_amount = gets.chomp.to_i
            else
              transacting = false
            end
          end
      else
        balance_before = @balance
        @balance = @balance + deposit_amount
        puts "Your balance was #{balance_before}. You have deposited #{deposit_amount}. Your balance is now #{@balance}."
        transacting = false
      end
    end
  end
  end


# #### Optional:
# - Create an `Owner` class which will store information about those who own the `Accounts`.
  # class Owner
  #
  #   attr_reader :first_name, :last_name
  #
  #   def initialize (ADDRESS_HASHES)
  #     ADDRESS_HASHES = address_hash[name]
  #     @first_name
  #     @last_name
  #     @middle_name
  #     @address = address_hash[:name]
  #   end
  #   #   - This should have info like name and address and any other identifying information that an account owner would have.
  #   # - Add an `owner` property to each Account to track information about who owns the account.
  #   #   - The `Account` can be created with an `owner`, OR you can create a method that will add the `owner` after the `Account` has already been created.

end
