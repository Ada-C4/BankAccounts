module Bank

  attr_accessor :balance

  class Account
    def initialize(account_id, balance, owner=nil)
      @account_id = account_id

      if balance < 0
        raise ArgumentError.new("Cannot start an account with a negative balance.")
      end

      @balance = balance
      @owner = owner
    end

    def withdraw(withdraw_amount)
      # returns updated balance
      if withdraw_amount.abs > @balance
        # raise ArgumentError.new("Cannot withdraw more than is in account.")
        puts "Not enough money in account"
        puts "The current balance is: #{@balance}"
      else
        @balance = @balance - withdraw_amount.abs
        puts "Your updated balance is: #{@balance}"
      end
    end

    def deposit(deposit_amount)
      # returns updated balance
      @balance = @balance + deposit_amount
      puts "Your updated balance is: #{@balance}"
    end

    def assign_owner(owner_hash)
      @owner = owner
      puts "The owner of this account is #{@owner.first_name} #{@owner.last_name}."
    end
  end

  class Owner

    attr_reader :first_name, :last_name, :street, :city, :state, :zip

    def initialize(owner_hash)
      @first_name = owner_hash[:first_name]
      @last_name = owner_hash[:last_name]
      @street = owner_hash[:street]
      @city = owner_hash[:city]
      @state = owner_hash[:state]
      @zip = owner_hash[:zip]
    end
  end
end

BILBO = {
  :first_name => "Bilbo",
  :last_name => "Baggins",
  :street => "Bag End Bagshot Row",
  :city => "Hobbiton",
  :state => "Middle Earth",
  :zip => "na"
}
