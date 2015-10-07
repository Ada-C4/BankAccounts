require 'csv'

module Bank
  class Account
    attr_reader :id, :balance, :open_date
    def initialize(id, balance, open_date)
      @id = id
      @balance = balance
      if balance < 0
        raise ArgumentError, "Not a valid initial balance!"
      end
      @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %Q")
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
    csv_file = CSV.read("./support/accounts.csv")
  end
end
account = Bank::Account.new("1212", 1235667, "1999-03-27 11:30:09 -0800")
puts account.id
puts account.balance
puts account.open_date
