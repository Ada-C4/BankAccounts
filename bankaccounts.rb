require 'csv'
require 'pry'

module Bank
  class Account
    attr_reader :id, :balance, :open_date
    attr_accessor :owner

    def initialize(id, initial_balance, open_date)
      @balance = initial_balance.to_i
      if initial_balance.to_i < 0
          raise ArgumentError, "Invalid Balance: Balance may not be negative."
      end
      @id = id.to_i
      @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %z")
      @owner = nil
    end

    def withdraw(withdraw_amount)
      if withdraw_amount > @balance
        puts "Warning: Can not withdraw more than is in account. Transaction terminated."
      else
        @balance -= withdraw_amount
      end
    return @balance
    end

    def deposit(deposit_amount)
      @balance += deposit_amount
      return @balance
    end

    def self.all
        accounts_array = CSV.read('support/accounts.csv').map do |account|
           Bank::Account.new(account[0],account[1],account[2])
        end
    end

    def self.find(id)
      accounts_array = self.all
      accounts_array.find do |account|
        account.id == id
      end
    end

    def self.connect_owners
      account_owners = []
      CSV.read('support/account_owners.csv').each do |row|
        account = self.find(row[0].to_i)
        owner = Bank::Owner.find(row[1].to_i)
        account.owner = owner
        account_owners.push(account)
      end
      return account_owners
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
