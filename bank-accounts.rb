require 'csv'

module Bank

  class Owner

    attr_reader :id, :last, :first, :street, :city, :state

    def initialize(id, last, first, street, city, state)
      @id = id.to_i
      @first = first
      @last = last
      @street = street
      @city = city
      @state = state
    end

    def self.all
      owners_list = []
      owners_csv = CSV.read("./support/owners.csv")

      owners_csv.each do |row|
        owner = Bank::Owner.new(row[0], row[1], row[2], row[3], row[4], row[5])
        owners_list.push(owner)
      end

      return owners_list
    end

    def self.find(id)
      owners_list = self.all

      owners_list.find do |instance|
        instance.id == id
      end
    end

  end

  class Account
    # @@id_variable = 1000

    attr_reader :balance, :id
    attr_accessor :owner, :date, :account_list

    def initialize(id, initial_balance, open_date, owner = nil)
      @id = id.to_i
      @balance = initial_balance.to_i

      if open_date != nil
        @date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %z")
      end
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

    def self.all
      account_list = []
      account_csv = CSV.read("./support/accounts.csv")

      account_csv.each do |row|
        account = Bank::Account.new(row[0], row[1], row[2])
        account_list.push(account)
      end

      return account_list
    end

    def self.find(id)
      account_list = self.all

      found = account_list.find do |instance|
        instance.id == id
      end

      return found
    end

    def self.master_list
      master_list = []
      account_owners_csv = CSV.read("./support/account_owners.csv")

       account_owners_csv.each do |row|
        account = self.find(row[0].to_i)
        owner_of_account = Bank::Owner.find(row[1].to_i)

        account.owner = owner_of_account
        master_list.push(account)
      end

      return master_list
    end

  end
end


### TEST TAIMMMMMM

# Test self.master_list
# master = Bank::Account.master_list
# puts master[0].id
# puts master[0].owner.first

# Test self.all method for Owner
# test = Bank::Owner.all
# puts test[0].first

# Test self.find(id) for Owner
# own = Bank::Owner.find(14)
# puts own.first

# Instantiate a test manually using CSV data and test it
# test = Bank::Account.new("1212","1235667","1999-03-27 11:30:09 -0800")
# puts test.id
# puts test.date
# puts test.balance
# puts test.owner

# Test self.all method for Account
# puts Bank::Account.all

# acc = Bank::Account.find(1212)
# puts acc.id
