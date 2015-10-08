# figure out how to add to Bank module
module Bank

  class Account
    attr_reader :balance, :account_id, :owner, :all_accounts, :open_date

    def initialize(id, balance, open_date)

      if balance.to_i < 0
        raise StandardError, "You cannot open an account in debt."
      end

      @account_id = id
      @balance = balance * 100
      @open_date = open_date
      @min_balance = 0
      @overdraft_amt = 0
      @act_withdraw_fee = 0
      # @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %Q")
    end

    def withdraw(withdraw_amt)
      withdraw_to_cents = withdraw_amt * 100

      if (@balance - withdraw_to_cents) < (@min_balance + @act_withdraw_fee)
        puts "You cannot withdraw that much. Your current balance is #{@balance} cents"
      else
        @balance -= (withdraw_to_cents + @act_withdraw_fee)
        puts "Your account balance is now #{@balance} cents."
      end
    end

    def deposit(deposit_amt)
      deposit_to_cents = deposit_amt * 100

      @balance += deposit_to_cents
      puts "Your previous account balance was #{@balance - deposit_to_cents} cents."
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
  end
end
