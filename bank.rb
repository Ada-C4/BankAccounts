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
  class Account

    attr_reader :initial_balance, :id

    def initialize (initial_balance, id=rand(100000..999999))
      @balance = initial_balance
        if initial_balance < 0
          raise ArgumentError
        end
      @id = id
    end

    # def current_balance
    #   @initial_balance
    # end

    def withdraw(take_money)
      if take_money > @balance
        puts "You have #{@initial_balance} in your account. You can only widthdraw less than your total balance."
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
  end
end

test = Bank::Account.new(2)
puts test.id
puts "Your deposit is"
puts test.deposit(20)
puts "Your withdraw is"
puts test.withdraw(10)


# class Owner
#
#   attr_reader :name, :street_1, :street_2, :city, :state, :zip, :ssn
#
#   def initialize(owner_hash)
#     @name = owner_hash[:name]
#     @street_1 = owner_hash[:street_1]
#     @street_2 = owner_hash[:street_2]
#     @city = owner_hash[:city]
#     @state = owner_hash[:state]
#     @zip = owner_hash[:zip]
#     @ssn = owner_hash[:ssn]
#   end
# end


# test2 = Bank::Account.new(-1, 3)
# puts puts test.id
# puts "Your deposit is"
# puts test.deposit(20)
