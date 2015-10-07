require 'csv'
require 'pry'

module Bank
  class Account
    attr_reader :id, :balance, :open_date, :owner

    def initialize(id, initial_balance, open_date, owner = nil)
      @balance = check_initial_balance(initial_balance)
      @id = id.to_i
      @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %z")
      @owner = owner
    end

    def check_initial_balance(initial_balance)
      if initial_balance.to_i < 0
          raise ArgumentError, "Invalid Balance: Balance may not be negative."
      else
        return initial_balance.to_i
      end
    end

    def withdraw(withdraw_amount)
      if withdraw_amount > @balance
        puts "Warning: Can not withdraw more than is in account. Transaction terminated."
        return @balance
      else
        @balance -= withdraw_amount
        return @balance
      end
    end

    def deposit(deposit_amount)
      @balance += deposit_amount
      return @balance
    end

    def assign_owner(owner_name)
      @owner = owner_name
    end

    def self.all
      accounts_array =[]
      CSV.read('support/accounts.csv').map do |a|
         x = Bank::Account.new(a[0],a[1],a[2])
         accounts_array.push(x)
      end
      return accounts_array
    end

    def self.find(id)
      accounts_array = self.all
      accounts_array.find do |account|
        account.id == id
      end
    end

  end

  class Owner
    attr_reader :id, :lastname, :firstname, :street, :city, :state
    def initialize(id, lastname, firstname, street, city, state)
      @id = id.to_i
      @lastname = lastname
      @firstname = firstname
      @street = street
      @city = city
      @state = state
    end

    def self.all
      owners_array =[]
      CSV.read('support/owners.csv').map do |o|
         x = Bank::Owner.new(o[0],o[1],o[2],o[3],o[4],o[5])
         owners_array.push(x)
      end
      return owners_array
    end

    def self.find(id)
      owners_array = self.all
      owners_array.find do |owner|
        owner.id == id
      end
    end

  end

end
