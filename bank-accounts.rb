# run this file with
# irb -r "./bank-accounts.rb"

require 'csv'

module Bank

  class Account
    attr_reader :balance, :owner, :open_date, :ident

    def initialize(ident, balance, open_date)
      @ident = ident
      @balance = balance
      raise ArgumentError.new("Your intial balance can't be negative") if balance < 0
      @open_date = DateTime.strptime(open_date, '%Y-%m-%d %H:%M:%S %z')
    end

    def self.all
      account_array = []
      CSV.read("./support/accounts.csv", 'r').each do |row|
        account = Bank::Account.new(row[0].to_i, row[1].to_i, row[2])
        account_array.push(account)
      end
      return account_array
    end

    def self.find(id)
      self.all.find do |account|
        account.ident == id
      end
    end

    def assign_owner(person) # pass in an instance of Owner
      @owner = person
      puts "The owner of the account is #{@owner.first_name} #{@owner.last_name}"
    end

    def withdraw(withdraw_amount)
      if @balance - withdraw_amount < 0
        puts "Insufficient funds. Withdraw denied."
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
    attr_reader :first_name, :last_name, :address_one, :address_two, :city, :state, :zip

    def initialize(owner_hash)
      @first_name = owner_hash[:first_name]
      @last_name = owner_hash[:last_name]
      @address_one = owner_hash[:address_one]
      @address_two = owner_hash[:address_two]
      @city = owner_hash[:city]
      @state = owner_hash[:state]
      @zip = owner_hash[:zip]
    end

  end

end


### example ###
### constants are used for availability in irb ###

# JENNA_ACCT = Bank::Account.new("Jenna ID", 1200)
#
# jenna_info = {
#   first_name: "Jenna",
#   last_name: "Nichols",
#   address_one: "4900 Linden Ave N",
#   city: "Seattle",
#   state: "WA",
#   zip: "98103"
# }
#
# JENNA_OWNER = Bank::Owner.new(jenna_info)

# can assign JENNA_OWNER to JENNA_ACCT as follows
# JENNA_ACCT.assign_owner(JENNA_OWNER)
