require 'csv'

module Bank
  class Account
    attr_reader :ident, :balance, :open_date
    def initialize(ident, balance, open_date)
      @ident = ident.to_i
      @balance = balance.to_i
      @min_balance = 0
      check_valid_balance
      @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %z")
    end
    def check_valid_balance
      if @balance < @min_balance
        raise ArgumentError, "Not a valid initial balance!"
      end
    end
    def withdraw(amount)
      if amount > @balance
        puts "Not enough fundz!"
      else
        @balance = @balance - amount
      end
      return @balance
    end
    def deposit(amount)
      @balance = @balance + amount
    end
    def self.all
      CSV.read("./support/accounts.csv").map do |row|
      Bank::Account.new(row[0], row[1], row[2])
      end
    end
    def self.find(id)
      self.all.find do |account|
        account.ident == id
      end
    end
  end
end
