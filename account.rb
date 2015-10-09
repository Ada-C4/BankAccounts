# figure out how to add to Bank module
module Bank

  class Account
    attr_reader :balance, :account_id, :owner, :all_accounts, :open_date

    def initialize(id, balance, open_date)

      @account_id = id
      @balance = balance * 100
      @open_date = open_date
      @min_balance = 0
      @act_withdraw_fee = 0
      @mm_account_fee = 0
      # @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %Q"
      if balance.to_i < @min_balance
        raise StandardError, "You cannot open an account with that little money."
      end
    end

    def withdraw(withdraw_amt)
      withdraw_to_cents = withdraw_amt * 100

      if (@balance - withdraw_to_cents) < (@min_balance + @act_withdraw_fee)
        puts "You cannot withdraw that much. Your current balance is #{@balance} cents"
      elsif @act_withdraw_fee > 0
        if (@balance - withdraw_to_cents) > @mm_min_balance
          @balance -= withdraw_to_cents
          puts "Your account balance is now #{@balance} cents."
        else
          @balance -= (withdraw_to_cents + @act_withdraw_fee)
          puts "You've withdrawn your account below #{@mm_min_balance}, so you'll be charged #{@act_withdraw_fee} cents."
          puts "You must deposit enough for your account to be above #{@mm_min_balance} cents before you can withdraw any more."
          puts "Your new balance is #{@balance} cents."
        end
      else
        @balance -= (withdraw_to_cents + @act_withdraw_fee)
        puts "Your account balance is now #{@balance} cents."
      end
    end

    def deposit(deposit_amt)
      deposit_to_cents = deposit_amt * 100

      if @mm_min_balance > 0
        if @balance >= 10_000_00
          @balance += deposit_to_cents
          puts "Your previous account balance was #{@balance - deposit_to_cents} cents."
          puts "It is now #{@balance} cents."
          @transactions -= 1
        elsif @balance + deposit_to_cents >= 10_000_00
          @balance += deposit_to_cents
          puts "Your previous account balance was #{@balance - deposit_to_cents} cents."
          puts "It is now #{@balance} cents."
        else
          @balance += deposit_to_cents
          @transactions -= 1
          puts "Your previous account balance was #{@balance - deposit_to_cents} cents."
          puts "It is now #{@balance} cents."
          puts "You still need to deposit #{@mm_min_balance - @balance} before you can withdraw any more."
        end

      else
        @balance += deposit_to_cents
        puts "Your previous account balance was #{@balance - deposit_to_cents} cents."
        puts "It is now #{@balance} cents."
      end
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
