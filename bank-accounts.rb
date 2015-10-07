require 'csv'

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
    attr_accessor :owner, :date, :account_list

    def initialize(id, initial_balance, open_date, owner = nil)
      @id = id.to_i
      @balance = initial_balance.to_i
      # @id = @@id_variable
      # @@id_variable += 1
      @date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %z")
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

      account_list.find do |instance|
        instance.id == id
      end
    end

  end

end

# Instantiate a test manually using CSV data and test it
# test = Bank::Account.new("1212","1235667","1999-03-27 11:30:09 -0800")
# puts test.id
# puts test.date
# puts test.balance
# puts test.owner

# Test self.all method
# puts Bank::Account.all

acc = Bank::Account.find(1212)
puts acc.id
