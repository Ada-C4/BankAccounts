require 'pry'
require 'csv'

module Bank
  class Account

    attr_reader :balance, :id
    attr_accessor :owner, :min_balance, :fee, :acct_type


    def initialize(id, initial_balance, open_date)
      @id = id.to_i
      #@balance = initial_balance.to_i/100.00
      @balance = initial_balance.to_i
      @open_date = open_date
      @min_balance =  0
      @fee = 0
      #@acct_type = "Account"
      #open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %z")

      # Raises an argument error if the initial balance is less than 0
      if initial_balance.to_i < @min_balance
        raise ArgumentError, "The balance cannot be less than 0."
      end
    end


    # Creates accounts from the accounts.csv file
    def self.all
      @accounts = []
      accounts_csv = CSV.read("support/accounts.csv")
      accounts_csv.each do |id, balance, date|
        balance = balance.to_i/100
        date = DateTime.strptime(date, "%Y-%m-%d %H:%M:%S %z")
        id = Bank::Account.new(id, balance ,date)
        @accounts.push(id)
      end
      #puts @accounts
      return @accounts
    end

    # Finds the account with the ID that matches the passed parameter and returns the instance
    def self.find(id_search)
      found = @accounts.find do |account|
        account.id == id_search
      end
      return found
    end

    # Links owners with accounts
    def self.link_owner
      self.all
      Bank::Owner.all
      accounts_with_owners = []
      account_owners_csv = CSV.read("support/account_owners.csv")
      account_owners_csv.each do |row|
        account = self.find(row[0].to_i)
        owner_account = Bank::Owner.find(row[1].to_i)
        account.owner = owner_account
        accounts_with_owners.push(account)
      end
      return accounts_with_owners
    end

    # ----------------------------------------- #
              # Work below is extra #

    # Displays (with formatting) the account details for all the accounts in accounts.csv
    # (Made this on accident and didn't want to let it go to waste!)
    def self.all_print_nice
      if @accounts == nil
        puts "There are no accounts."
      else
        @accounts.each do |account|
          puts account
          account.current_balance
        end
      end
      return
    end

    # Finds an account by id passed in as a parameter and displays the account information nicely formatted
    # (Made this on accident and didn't want to let it go to waste!)
    def self.find_and_display(id_search)
      found = @accounts.find do |account|
        account.id == id_search
      end
      return found.current_balance
    end
          # end of extra work #
# ----------------------------------------#

    # Method for withdrawing from account
    def withdraw(orig_amount_to_withdraw)
      #orig_amount_to_withdraw = orig_amount_to_withdraw/100.00

      amount_to_withdraw = orig_amount_to_withdraw + @fee
      # Checks that the user is not withdrawing more than what is available in the account

      # if the requested withdrawal is more than the minimum balance
      if (@balance - amount_to_withdraw) < @min_balance
        # If we are dealing with a MoneyMarket account
        if @acct_type == "MoneyMarket"
          if (@balance - amount_to_withdraw - @money_market_fee) < 0 || @allowed_to_withdraw == false
            puts "Sorry you cannot make that withdrawal without depositing more money."
          else
            puts "As this transaction puts your balance below $#{@min_balance}, a fee of $#{@money_market_fee} has been imposed."
            @balance -= (amount_to_withdraw + @money_market_fee)
            puts "Your balance is $#{@balance}"
            @allowed_to_withdraw = false
          end
        else
          puts "The requested withdrawal is more than the available funds."
          if (@balance-@min_balance-@fee) < 0
            puts "You have no money left to withdraw."
          else
            puts "You only have $#{@balance-@min_balance-@fee} available for withdrawal."
          end
        end
        return @balance
      else
        # makes the withdrawal and displays info to the user
        @balance -= (amount_to_withdraw)
      #  puts balance
      #  puts amount_to_withdraw
        puts "You have withdrawn $#{orig_amount_to_withdraw}"
        if @fee != 0
          puts "You have also incurred a $#{@fee} fee."
        end
        puts "Your current balance is $#{@balance}"
        return @balance
      end
    end


    # Method for depositing into account
    def deposit(amount_to_deposit)
      # Makes the deposit and displays info to the user
      @balance += amount_to_deposit
      puts "You have deposited $#{amount_to_deposit}."
      puts "Your current balance is $#{@balance}."
      return @balance
    end

    # Displays current balance in the account
    def current_balance
      puts "The account with ID #{@id} currently has a balance of $#{@balance}."
      puts "This account was set up on #{@open_date}"
    end

    def add_interest(rate)
      if acct_type == "MoneyMarket" || acct_type == "Savings"
        interest =  @balance * rate/100
        @balance += interest
        return interest
      else
        puts "This type of account does not accumulate interest."
      end
    end

  end

  class Owner
    attr_reader :first_name, :last_name, :street, :city, :state, :id

    def initialize(owner_hash)
      @id = owner_hash[:id]
      @first_name = owner_hash[:first_name]
      @last_name = owner_hash[:last_name]
      @street_address = owner_hash[:street_address]
      @city = owner_hash[:city]
      @state = owner_hash[:state]
    end

    # Method to display details of an owner instance
    def print_owner_details
      puts "The owner of this account is #{@first_name} #{@last_name}."
      puts "Street: #{@street_address}"
      puts "City: #{@city}"
      puts "State: #{@state}"
    end

    # Creates accounts from the accounts.csv file
    def self.all
      owner_hash = Hash.new
      @owners = []
      owners_csv = CSV.read("support/owners.csv")
      owners_csv.each do |id, last_name, first_name, street_address, city, state|
        owner_hash[:id] = id.to_i
        owner_hash[:last_name] = last_name
        owner_hash[:first_name] = first_name
        owner_hash[:street_address] = street_address
        owner_hash[:city] = city
        owner_hash[:state] = state
        id = Bank::Owner.new(owner_hash)
        @owners.push(id)
      end
      puts @owners
      return @owners
    end

    # Finds the owner with the ID that matches the passed parameter and returns the instance
    def self.find(id_search)
      found = @owners.find do |owner|
        owner.id == id_search
      end
      return found
    end


# ----------------------------------------- #
          # Work below is extra #

    # Displays (with formatting) the owner details for all the accounts in owners.csv
    def self.all_print_nice
      if @owners == nil
        puts "There are no accounts."
      else
        @owners.each do |owner|
          owner.print_owner_details
        end
      end
      return
    end

    # Finds an owner by id passed in as a parameter and displays the owner information nicely formatted
    def self.find_and_display(id_search)
      found = @owners.find do |owner|
        owner.id == id_search
      end
      return found.print_owner_details
    end

        # end of extra work #
# ----------------------------------------#

  end
end
