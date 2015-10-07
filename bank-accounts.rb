module Bank

  class Owner

    attr_reader :first, :last, :address, :owner_id

    def initialize(owner_info)
      @owner_id = owner_info[:owner_id]
      @first = owner_info[:first]
      @last = owner_info[:last]
      @address = owner_info[:address]
    end

  end

  class Account
    # @@id_variable = 1000

    attr_reader :balance, :id
    attr_accessor :owner

    def initialize(id, owner = nil, initial_balance = 0)
      @balance = initial_balance
      @id = id
      # @id = @@id_variable
      # @@id_variable += 1

      @owner = owner

      raise ArgumentError if @balance < 0
    end

    def withdraw(withdrawal)
      if withdrawal <= @balance
        @balance -= withdrawal
      else
        print "You cannot withdraw more than is in your bank account. "
      end

      return @balance
    end

    def deposit(deposit_amt)
      @balance += deposit_amt

      return @balance
    end

  end

end

# TEST TAIMMMMMMM!

test = Bank::Account.new(654321)
puts "Your bank ID is: #{test.id}."
puts "Your initial balance is: #{test.balance}"
puts "Your balance after the deposit is: #{test.deposit(20)}."
puts "Your balance after withdrawal is: #{test.withdraw(10)}"
puts "Your balance is #{test.withdraw(500)}."
puts "Your balance after withdrawal is: #{test.withdraw(5)}"

# test2 = Bank::Account.new(-10)
# puts test2.balance

daphne_hash = {
  first: "Daphne",
  last: "Gold",
  address: "1601 9th Ave Apt 302, Seattle, WA 98101",
  owner_id: 5555
}

daphne = Bank::Owner.new(daphne_hash)

test.owner = daphne
puts test.owner.first
puts test.id
puts test.owner.owner_id

testing_hash = {
  first: "Unicorn",
  last: "Man",
  address: "Happy Unicorn Fun Land",
  owner_id: 1234
}

unicorn_man = Bank::Owner.new(testing_hash)
test2 = Bank::Account.new(123456, unicorn_man)
puts test2.owner.first
puts test2.id
puts test2.owner.owner_id

puts "Your balance after the deposit is: #{test2.deposit(1000)}."
puts "Your balance after withdrawal is: #{test2.withdraw(10)}"
puts "Your balance is #{test2.withdraw(500)}."

puts test.balance
puts test2.balance
