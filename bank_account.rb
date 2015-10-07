require 'CSV'

module Bank

  class Account
    attr_reader :balance, :id, :owner, :open_date
    def initialize(id, balance, open_date)
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
      csv_array = CSV.read("support/accounts.csv")
      acct = csv_array.find do |line|
        line[0].to_i == id
      end
      puts "The account you searched for is #{acct}"
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
