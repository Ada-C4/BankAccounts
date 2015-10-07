require 'chronic'
require 'csv'

module Bank

  class Account

    attr_reader :balance, :owner

    def initialize(account_id, initial_balance, open_date)
      @account_id = account_id.to_i
      @balance = check_initial_balance(initial_balance.to_i)
      @open_date = Chronic.parse(open_date)
    end

    def withdraw(amount)
      if amount <= @balance
        @balance -= amount
      else
        puts "Your balance is #{@balance}. You cannot withdraw #{amount} at this time."
        return @balance
      end
    end

    def deposit(amount)
        @balance += amount
    end

    def check_initial_balance(initial_balance)
      if initial_balance < 0
        raise ArgumentError.new("Your initial balance must be positive!")
      else
        return initial_balance
      end
    end

    def self.all
      account_array = CSV.read("support/accounts.csv")
      print account_array
    end

    def self.find(id)
    end

    def add_owner(owner)
      @owner = owner
    end

  end

  class Owner

    attr_reader :first_name ,:last_name, :address_line_1, :address_line_2, :city, :state, :zip, :email

    def initialize(owner_hash)
      @first_name = owner_hash[:first_name]
      @last_name = owner_hash[:last_name]
      @address_line_1 = owner_hash[:address_line_1]
      @address_line_2 = owner_hash[:address_line_2]
      @city = owner_hash[:city]
      @state = owner_hash[:state]
      @zip = owner_hash[:zip]
      @email = owner_hash[:email]
    end

  end

end

test_owner_hash = {
  first_name: "Joe",
  last_name: "Scmoe",
  address_line_1: "123 Apple Street",
  city: "Seattle",
  state: "WA",
  zip: "98103",
  email: "joe@example.com",

}
