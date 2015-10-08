require 'csv'

module Bank
  class Account
    attr_reader :ident, :balance, :open_date
    attr_accessor :owner
    def initialize(ident, balance, open_date, owner = nil)
      @ident = ident.to_i
      @balance = balance.to_i
      if @balance < 0
        raise ArgumentError, "Not a valid initial balance!"
      end
      @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %z")
      @owner = owner
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

  class Owner
    attr_reader :id, :first, :last, :street_address, :city, :state, :zip
    def initialize(owner_info)
      @id = rand(1000000)
      @first = owner_info[:first]
      @last = owner_info[:last]
      @street_address = owner_info[:street_address]
      @city = owner_info[:city]
      @state = owner_info[:state]
      @zip = owner_info[:zip]
    end
  end
end

Bank::Account.find(1213)
