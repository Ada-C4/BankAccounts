require 'csv'
require 'pry'

module Bank
  class Account
    attr_accessor :id, :balance, :opendate
    def initialize (id, balance, opendate)
      @id = id
      @balance= balance.to_i
      @open_date = DateTime.strptime(opendate, "%Y-%m-%d %H:%M:%S %z")

      if @balance < 0
        raise ArgumentError.new ("You must start an account with more funds than $0")
      else
        puts "Welcome, #{@name}.  Thank you for opening a new account. Your balance is $#{@balance}"
      end
    end

    def withdraw (withdrawal_amount)
      if withdrawal_amount > @balance
        puts "You have insufficient funds. You have $#{@balance} in your account."
      elsif withdrawal_amount > 0
        @balance = @balance - withdrawal_amount
        puts "You withdrew $#{withdrawal_amount}. Your new balance is $#{@balance}."
      end
      return @balance
    end

    def balance
      return @balance
    end

    def deposit (deposit_amount)
      if deposit_amount > 0
        @balance = @balance + deposit_amount
        puts "You deposited $#{deposit_amount}.  Your new balance is $#{@balance}."
      end
      return @balance
    end

    def self.all
      #returns a collection of Account instances representing all of the Accounts in CSV
        account_csv = CSV.read("./support/accounts.csv")
        account_array= []
        account_csv.each do |row|
          account =Bank::Account.new(row[0],row[1].to_i,row[2])
          account_array.push(account)
        end

      return account_array
    end

      def self.find(id)
        all_accounts = Account.all
        all_accounts.each do |account|
          if id == account.id
            return account
          end
        end

      end

  end
end
