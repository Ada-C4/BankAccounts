# Create a Bank module which will contain your Account class and any future bank account logic.
#
# Create an Account class which should have the following functionality:
#
# A new account should be created with an ID and an initial balance
# Should have a withdraw method that accepts a single parameter
#     which represents the amount of money that will be withdrawn.
#     This method should return the updated account balance.
# Should have a deposit method that accepts a single parameter
    # which represents the amount of money that will be deposited. This method should return the updated account balance.
# Should be able to access the current balance of an account at any time.
# Error handling
#
# A new account cannot be created with initial negative balance - this will raise an ArgumentError (Google this)
# The withdraw method does not allow the account to go negative
# - Will output a warning message and return the original un-modified balance

module Bank
  class Owner

    attr_reader :first_name, :last_name, :street_1, :street_2, :city, :state, :zip, :ssn

    def initialize(owner_hash)
      @first_name = owner_hash[:first_name]
      @last_name = owner_hash[:last_name]
      @street_1 = owner_hash[:street_1]
      @street_2 = owner_hash[:street_2]
      @city = owner_hash[:city]
      @state = owner_hash[:state]
      @zip = owner_hash[:zip]
      @ssn = owner_hash[:ssn]
    end
    # def print_info
    #   puts "#{@first_name} #{@last_name} is the owner of this account, from #{@city}, #{@state}."
    # end
  end

  class Account

    attr_reader :initial_balance, :id, :owner

    def initialize (initial_balance, id=rand(100000..999999))
      @balance = initial_balance
        if initial_balance < 0
          raise ArgumentError
        end
      @id = id
    end

    def withdraw(take_money)
      if take_money > @balance
        puts "You have #{@balance} in your account. You can only widthdraw less than your total balance."
      else @balance -= take_money
        return @balance
      end
    end

    def deposit(get_money)
      # puts "How much money would you like to deposit?"
      # deposit = gets.chomp.to_i
      @balance += get_money
      return @balance
    end

    def add_owner
      @owner = owner
    end

  end


end

name = Bank::Owner.new({name: "Sarah", zip: "98933"})

test = Bank::Account.new(2)
puts test.id
puts "Your deposit is"
puts test.deposit(20)
puts "Your withdraw is"
puts test.withdraw(10)


# test2 = Bank::Account.new(-1, 3)
# puts puts test.id
# puts "Your deposit is"
# puts test.deposit(20)
