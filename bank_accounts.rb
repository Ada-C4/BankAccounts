require 'csv'

module Bank
  class Account
    attr_reader :balance, :owner, :id, :open_date
    def initialize(id, initial_balance, open_date, owner = nil)
      if(initial_balance < 0)
        raise ArgumentError, "Your initial balance must be a positive value."
      end
      @balance = initial_balance
      @id = id
      @open_date = open_date
      @owner = owner
    end

    def self.all
      file_array = CSV.read("support/accounts.csv")
      accounts_array = []
      file_array.each do |line|
        new_account = Account.new(line[0].to_i, line[1].to_i, line[2])
        accounts_array.push(new_account)
      end
      return accounts_array
    end

    def self.find(id)
      match = CSV.open("support/accounts.csv").find { |n| n[0].to_i == id}
      account = Account.new(match[0].to_i, match[1].to_i, match[2])
      return account
    end

    def add_owner(owner)
      @owner = owner
    end

#create an ultimate list of all accounts with associated owners
    def self.get_ultimate_list
      csv_file = CSV.read("support/account_owners.csv")
      ultimate_list = []
      csv_file.each do |line|
        account_match = Bank::Account.find(line[0].to_i)
        owner_match = Bank::Owner.find(line[1].to_i)
        account_match.add_owner(owner_match)
        ultimate_list.push(account_match)
      end
      return ultimate_list
    end

    def withdraw(amount)
      if (@balance < amount)
        puts "This will result in a negative account balance. Transaction terminated."
      else
        @balance -= amount
      end
      return @balance
    end

    def deposit(amount)
      @balance += amount
      return @balance
    end
  end

  class Owner
    attr_reader :id, :last_name, :first_name, :street_address, :city, :state
    def initialize(id, last_name, first_name, street_address, city, state)
      @id = id
      @last_name = last_name
      @first_name = first_name
      @street_address = street_address
      @city = city
      @state = state
    end

    def self.all
      file_array = CSV.read("support/owners.csv")
      owners_array = []
      file_array.each do |line|
        new_owner = Owner.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5])
        owners_array.push(new_owner)
      end
      return owners_array
    end

    def self.find(id)
      match = CSV.open("support/owners.csv").find { |n| n[0].to_i == id}
      owner = Owner.new(match[0].to_i, match[1], match[2], match[3], match[4], match[5])
      return owner
    end

  end
end
