# run this file with
# irb -r "./bank-accounts.rb"

require 'csv'

module Bank

  class Account
    @@min_balance = 0

    attr_reader :balance, :owner, :open_date, :ident

    def initialize(ident, open_date, balance)
      @ident = ident
      @open_date = DateTime.strptime(open_date, '%Y-%m-%d %H:%M:%S %z')
      @balance = balance
      raise ArgumentError.new("Your intial balance can't be less than #{@@min_balance}") if balance < @@min_balance
    end

    def self.all
      CSV.read("./support/accounts.csv", 'r').map do |row|
        Bank::Account.new(row[0].to_i, row[1].to_i, row[2])
      end
    end

    def self.find(id)
      self.all.find do |account|
        account.ident == id
      end
    end

    def self.ultimate_list
      ultimate_list = []
      CSV.read("./support/account_owners.csv", 'r').each do |row|
        acct = Bank::Account.find(row[0].to_i)
        person = Bank::Owner.find(row[1].to_i)
        acct.assign_to_owner(person)
        ultimate_list.push(acct)
      end
      return ultimate_list
    end

    ### alternate method for making the list ###
    # def self.other_thing
    #   CSV.read("./support/account_owners.csv", 'r').map do |row|
    #     acct = Bank::Account.find(row[0].to_i)
    #     person = Bank::Owner.find(row[1].to_i)
    #     acct.assign_to_owner(person)
    #     acct
    #   end
    # end

    def assign_to_owner(person) # pass in an instance of Owner
      @owner = person
    end

    def withdraw(withdraw_amount)
      min_balance = 0
      if @balance - withdraw_amount < @@min_balance
        puts "Insufficient new balance. Withdraw denied."
        @balance
      else
        @balance -= withdraw_amount
      end
    end

    def deposit(deposit_amount)
      @balance += deposit_amount
    end
  end

  class Owner
    attr_reader :ident, :last_name, :first_name, :address, :city, :state

    def initialize(ident, last_name, first_name, address, city, state)
      @ident = ident
      @last_name = last_name
      @first_name = first_name
      @address = address
      @city = city
      @state = state
    end

    def self.all
      CSV.read("./support/owners.csv", 'r').map do |row|
        Bank::Owner.new(row[0].to_i, row[1], row[2], row[3], row[4], row[5])
      end
    end

    def self.find(id)
      self.all.find do |owner|
        owner.ident == id
      end
    end

  end

end
