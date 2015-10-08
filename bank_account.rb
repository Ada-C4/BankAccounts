require 'CSV'
#TO DO
#Use .map for the all method? since it returns an array you don't need to create one
module Bank

  class Account
    attr_accessor :balance, :id, :owner, :open_date
    def initialize(id, balance, open_date, owner = nil)
      @balance = balance.to_i
      @id = 7383092
      @owner = owner
      @open_date = open_date
      if @balance < 0
        raise ArgumentError, "Accounts cannot be opened with negative money"
      end
    end

    def withdraw(withdraw_amount)
      if @balance < withdraw_amount
        puts "Insufficient funds: withdraw denied. Your balance is #{@balance}."
      elsif @balance >= withdraw_amount
      @balance = @balance.to_i - withdraw_amount.to_i
      puts "Here is your cash monays. Your account balance is now #{@balance}"
      end
    end

    def deposit(deposit_amount)
      @balance = (@balance.to_i + deposit_amount.to_i)
      puts "Thanks for your cash monays. Your account balance is now #{@balance}"

    end

    def check_balance
      puts "You balance is #{@balance} cents"
    end

    def add_owner(owner)
      @owner = owner
    end

    def self.all
      acct_csv_array = CSV.read("support/accounts.csv")
      account_array = []
      acct_csv_array.each do |line|
        account_array.push(Account.new(line[0], line[1], line[2]))
      end
      return account_array
    end

    def self.find(id)
      acct_csv_array = CSV.read("support/accounts.csv")
      match_line = acct_csv_array.find do |line|
        line[0].to_i == id
      end
      specific_account = Account.new(match_line[0], match_line[1], match_line[2])
    end

    def self.associate_everything
      account_and_owner_csv = CSV.read("support/account_owners.csv")
      everything_array = []
      account_and_owner_csv.each do |line|
        each_account = Bank::Account.find(line[0].to_i)
        each_owner = Bank::Owner.find(line[1].to_i)
        each_account.add_owner(each_owner)
        everything_array.push(each_account)
      end
      return everything_array
    end
  end

  class Owner
    attr_reader :account, :owner_id, :last_name, :first_name, :address, :city, :state
    def initialize(id, last_name, first_name, address, city, state)
      @account = account
      @first_name = first_name
      @last_name = last_name
      @address =  address
      @owner_id = owner_id
    end

    def who_da_owna
      puts "This account is owned by #{@first_name} #{@last_name} with #{@owner_id}"
    end

    def self.all
      owner_csv_array = CSV.read("support/owners.csv")
      owner_array = []
      owner_csv_array.each do |line|
        owner_array.push(Owner.new(line[0], line[1], line[2], line[3], line[4], line[5]))
      end
      return owner_array
    end

    def self.find(id)
      owner_csv_array = CSV.read("support/owners.csv")
      match_line = owner_csv_array.find do |line|
        line[0].to_i == id
      end
      specific_owner = Owner.new(match_line[0], match_line[1], match_line[2], match_line[3], match_line[4], match_line[5])
    end
  end
end

# owner_hash = {
# first_name: "Winnie",
# last_name: "The Pooh",
# address: "Deep in the Hundred Acre Woods",
# email: "poohbear@christopherrobin.com",
# id: 2376423
# }

#a = Bank::Account.new("1212","1235667","1999-03-27 11:30:09 -0800")
#a.check_balance
#Bank::Account.all
#o = Bank::Owner.new(owner_hash)
#puts "#{a.owner.first_name}"
