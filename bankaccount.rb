require 'csv'

module Bank
  class Account
  #  @@identifier = 0
    attr_accessor :account_number, :balance, :owner, :open_date

    def initialize(id, starting_balance, date)
      @account_number = id
    #  @id = @@identifier
    #  @@identifier = +=1
      @balance = starting_balance
      if balance < 0
        raise ArgumentError, "Accounts cannot be created with a negative balance!"
      end
      @open_date = date
      @owner = nil
    end

    def withdraw(amount)
      if amount > @balance
        puts "That's more than you have available in your account! Your account balance is $#{@balance}."
      elsif amount <= @balance
        @balance = @balance - amount
        puts "You have withdrawn $#{amount} and your new account balance is $#{@balance}."
      end
    end

    def deposit(amount)
      @balance = @balance + amount
      puts "You have deposited $#{amount} and your new account balance is $#{@balance}."
    end

    def check_balance
      puts "Your account balance is $#{@balance}."
    end

    def self.all
      accounts = CSV.read("support/accounts.csv")
      accounts_array = []
      accounts.each do |line|
        new_account = Account.new(line[0],line[1].to_i,line[2])
        accounts_array.push(new_account)
      end
      return accounts_array
    end

    def self.find(id)
      accounts = CSV.read("support/accounts.csv")
      found = accounts.find { |account| account[0].to_i == id}
      new_account = Account.new(found[0].to_i,found[1].to_i,found[2])
      return new_account
    end



    # def self.next_id
    #   return @@identifier
    # end

    # def self.all
    #   a = Account.new()
    #   b = Account.new()
    #   account_list = [a,b]
    #   return account_list
    # end
    def add_owner(owner)
      @owner = owner
    end

    def self.match_owners
      matches = CSV.read("support/account_owners.csv")
      master_list = []
      matches.each do |line|
        account = Bank::Account.find(line[0].to_i)
        owner = Bank::Owner.find(line[1].to_i)
        account.add_owner(owner)
        master_list.push(account)
      end
      return master_list
    end

  end


  class Owner

    attr_reader :id, :first_name, :last_name, :street_address, :city, :state

    def initialize(id, first_name, last_name, street_address, city, state)
      @id = id
      @first_name = first_name
      @last_name = last_name
      @street_address = street_address
      @city = city
      @state = state
    end

    def self.all
      owners = CSV.read("support/owners.csv")
      owners_array = []
      owners.each do |line|
        new_owner = Owner.new(line[0],line[1],line[2],line[3],line[4],line[5])
        owners_array.push(new_owner)
      end
      return owners_array
    end

    def self.find(id)
      owners = CSV.read("support/owners.csv")
      found = owners.find { |owner| owner[0].to_i == id}
      new_owner = Owner.new(found[0].to_i,found[1].to_i,found[2],found[3],found[4],found[5])
      return new_owner
    end
  end

end

# puts "Would you like to create a new bank account today? Please enter your first name"
# # validate input
# first_name = gets.chomp
# puts "Now enter your last name"
# # validate input
# last_name = gets.chomp
# puts "Now enter your address"
# # validate input
# address = gets.chomp
# account_owner = Bank::Owner.new(first_name,last_name,address)
# puts account_owner
# puts "Please enter an amount of money to deposit in your account"
# initial_deposit = gets.chomp
# while initial_deposit.to_i.to_s != initial_deposit
#   puts "That's not a valid number! Please enter an amount of money to deposit"
#   initial_deposit = gets.chomp
# end
# new_account = Bank::Account.new(rand(100), initial_deposit.to_i, Date.today.to_s, account_owner)
# puts new_account
# action = "0"
# while action != "exit"
#   puts "What would you like to do with your account? You may 1. deposit funds 2. withdraw funds 3. check balance 4. exit"
#   action = gets.chomp
#   if action == "deposit funds"
#     puts "How much money would you like to deposit?"
#     # validate input
#     amount = gets.chomp.to_i
#     new_account.deposit(amount)
#   elsif action == "withdraw funds"
#     puts "How much money would you like to withdraw?"
#     # validate input
#     amount = gets.chomp.to_i
#     new_account.withdraw(amount)
#   elsif action == "check balance"
#     new_account.check_balance
#   elsif action == "exit"
#     exit
#   else
#     puts "That's not a valid action!"
#   end
# end
