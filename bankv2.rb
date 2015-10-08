# Update the Account class to be able to handle all of these fields from the CSV file used as input.
# For example, manually choose the data from the first line of the CSV file
# and ensure you can create a new instance of your Account using that data
# Add the following class methods to your existing Account class:
  # self.all - returns a collection of Account instances, representing all of the Accounts described in the CSV.
  #See below for the CSV file specifications
  # self.find(id) - returns an instance of Account where the value of the id field in the CSV matches
#the passed parameter

require 'csv'

module Bank

  class Account

    attr_reader :balance, :id, :owner, :open_date

#create instance variable for balance?
    def initialize (id, balance, open_date)
        if balance < 0
          raise ArgumentError
        end
      @balance = balance
      @id = id
      @open_date = open_date
    end


#you could also call this Account.all
    def self.all
      accounts_csv = CSV.read("./support/accounts.csv")
      #account_owner = Account.new(accounts_csv[0][0],accounts_csv[0][1], accounts_csv[0][2])
      accounts_csv.map! do |row|
        Account.new row [0].to_i, row [1].to_i, DateTime.parse(row [2])
      end

      return accounts_csv
    end

    def self.find(id)
      return Account.all.find do |account|
        account.id == id
      end
    end


    def withdraw(take_money)
      if take_money > @balance
        puts "You have #{@balance} in your account. You can only widthdraw less than your total balance."
      else @balance -= take_money
        return @balance
      end
    end

    def deposit(get_money)
      # puts "How much money would you like to deposit?"
      # deposit = gets.chomp.to_i
      @balance += get_money
      return @balance
    end

    def add_owner
      @owner = owner
    end
  end
end
  # class Owner
  #
  #   attr_reader :first_name, :last_name, :street_1, :street_2, :city, :state, :zip, :ssn
  #
  #   def initialize(owner_hash)
  #     @first_name = owner_hash[:first_name]
  #     @last_name = owner_hash[:last_name]
  #     @street_1 = owner_hash[:street_1]
  #     @street_2 = owner_hash[:street_2]
  #     @city = owner_hash[:city]
  #     @state = owner_hash[:state]
  #     @zip = owner_hash[:zip]
  #     @ssn = owner_hash[:ssn]
  #   end
    # def print_info
    #   puts "#{@first_name} #{@last_name} is the owner of this account, from #{@city}, #{@state}."
    # end
  # end

# name = Bank::Owner.new({name: "Sarah", zip: "98933"})
#
# test = Bank::Account.new(2, 1, 3)
# puts test.id
# puts "Your deposit is"
# puts test.deposit(20)
# puts "Your withdraw is"
# puts test.withdraw(10)




# test2 = Bank::Account.new(-1, 3)
# puts puts test.id
# puts "Your deposit is"
# puts test.deposit(20)
