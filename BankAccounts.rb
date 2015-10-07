require 'csv'

module Bank
  class Account
    attr_reader :id, :balance, :open_date
    def initialize(id, balance, open_date)
      @id = id.to_i
      @balance = balance.to_i
      if @balance < 0
        raise ArgumentError, "Not a valid initial balance!"
      end
      @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %z")
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
      account_array = []
      csv_file = CSV.read("./support/accounts.csv")
      csv_file.each do |row|
        new_acct = Bank::Account.new(row[0], row[1], row[2])
        account_array.push(new_acct)
      end
    end
    def self.find(id)
    end
  end
end
