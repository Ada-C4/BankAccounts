require "csv"
require "pry"

module Bank

  class Owner
    attr_reader :first_name, :last_name, :street_address, :owner_id

    def initialize(owner_id, last_name, first_name, street_address, city, state)
      @owner_id = id
      @first_name = first_name
      @last_name = last_name
      @street_address = street_address
      @city = city
      @state = state
    end

    def self.all
      all_owners = []

      CSV.read("./support/owners.csv").each do |line|
        y = Bank::Owner.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5])
        all_owners.push(y)
      end

      return all_owners
    end

    def self.find(id)
      Bank::Owner.all.find do |account_instance|
        account_instance.owner_id == id
      end
    end
  end

  class Account
    attr_reader :balance, :account_id, :owner, :all_accounts, :open_date

    def initialize(id, balance, open_date)

      if balance.to_i < 0
        raise StandardError, "You cannot open an account in debt."
      end

      @account_id = id
      @balance = balance
      @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %Q")
    end

    def withdraw(withdraw_amt)
      while (@balance - withdraw_amt) < 0
        puts "You cannot overdraft your account. Your current balance is #{@balance} cents"
        puts "Please enter a new withdrawl amount: "
        withdraw_amt = gets.chomp.to_i
      end

      @balance -= withdraw_amt
      puts "Your previous account balance was #{@balance + withdraw_amt} cents."
      puts "It is now #{@balance} cents."
    end

    def deposit(deposit_amt)
      @balance += deposit_amt
      puts "Your previous account balance was #{@balance - deposit_amt} cents."
      puts "It is now #{@balance} cents."
    end

    def show_balance
      puts "Your current balance is #{@balance} cents"
    end

    def assign_owner(first_name, last_name, address)
      @owner = Bank::Owner.new(first_name, last_name, address)
    end

    def self.all
      @all_accounts = []

      CSV.read("./support/accounts.csv").each do |line|
        y = Bank::Account.new(line[0].to_i, line[1].to_i, line[2])
        @all_accounts.push(y)
      end

      return @all_accounts
    end

    def self.find(id)
      Bank::Account.all.find do |account_instance|
        account_instance.account_id == id
      end
    end

    # working on this still
    # def self.match_owner
    #   Bank::Account.all
    #
    #   CSV.read("./support/accounts.csv").each do |line|
    #     binding.pry
    #     account = CSV.read("./support/account_owners.csv").find(line[0])
    #     owner = CSV.read("./support/owners.csv").find(account[1])
    #     Bank::Owner.new(owner)
    #     end

        # take the account id (line[0] in each loop) and find which owners_id within account_owners.csv it shares,
        # then take that owners_id, switch over to the owners.cvs, and initialize a new Owner based on that

    # end
  end

  class SavingsAccount < Account
    def initialize(id, balance, open_date)
      super
      if balance.to_i < 0
        raise StandardError, "You cannot open an account with less than $10."
      end
    end


  end


end
