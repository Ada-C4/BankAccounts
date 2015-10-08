module Bank

require 'csv'

  class Account

    attr_accessor :balance, :account_id, :owner

    def initialize(account_id, balance, datetime_open, owner = nil)
      @account_id = account_id
      @balance = balance
      @min_balance = 0
      @withdrawal_fee = 0
      if balance < @min_balance
        raise ArgumentError.new("Cannot start an account with a negative balance.")
      end
      @datetime_open = datetime_open # DateTime.strptime(datetime_open, "%Y-%m-%d %H:%M:%S %z")
      @owner = owner
    end

    def self.all
      accounts_csv = CSV.read("./support/accounts.csv")
      accounts_instances = []
      accounts_csv.each do |row|
        accounts_instances.push(Account.new(row[0], row[1].to_i, row[2]))
      end
      return accounts_instances
    end

    def self.find(id)
        self.all.find do |line|
        line.account_id.to_i == id
      end
      # new_account = Account.new(matched_id[0], matched_id[1], matched_id[2])
      # puts new_account
    end

    def self.everything
      account_owners_csv = CSV.read("./support/account_owners.csv")
      everything_array = []
      account_owners_csv.each do |line|
        each_account = self.find(line[0].to_i)
        each_owner = Bank::Owner.find(line[1].to_i)
        each_account.assign_owner(each_owner)
        everything_array.push(each_account)
      end
      return everything_array
    end

    def withdraw(withdraw_amount)
      # returns updated balance
      if withdraw_amount > (@balance + @min_balance + @withdrawal_fee)
        puts "Not enough money in account"
        puts "The current balance is only: #{@balance}"
      else
        @balance = (@balance - withdraw_amount - @withdrawal_fee)
        puts "Updated balance is: #{@balance}"
      end
    end

    def deposit(deposit_amount)
      # returns updated balance
      @balance = @balance + deposit_amount
      puts "Updated balance is: #{@balance}"
    end

    def assign_owner(owner_hash)
      @owner = owner
      # puts "The owner of this account is #{@owner.first_name} #{@owner.last_name}."
    end
  end
end
