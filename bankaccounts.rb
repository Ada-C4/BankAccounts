require 'csv'

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
    attr_reader :id, :firstname, :lastname, :birthdate, :address
    def initialize(owner_hash)
      @id = rand(99999)
      @firstname = owner_hash[:firstname]
      @lastname = owner_hash[:lastname]
      @birthdate = owner_hash[:birthdate]
      @address = owner_hash[:address]
    end
  end

end
