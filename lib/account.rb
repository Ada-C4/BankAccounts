require 'csv'
require './lib/owner.rb'

module Bank
  class Account

    attr_reader :balance, :id
    attr_accessor :owner, :min_balance, :fee, :acct_type, :allowed_to_withdraw


    def initialize(id, initial_balance, open_date)
      @id = id
      @balance = initial_balance.to_f.round(2)
      @open_date = open_date
      @min_balance =  0
      @fee = 0
      @owner = nil

      # Raises an argument error if the initial balance is less than 0
      if initial_balance.to_f < @min_balance
        raise ArgumentError, "The balance cannot be less than 0."
      end
    end

    # Creates accounts from the accounts.csv file
    def self.all
      @accounts = []
      accounts_csv = CSV.read("support/accounts.csv")
      # For each line in accounts pass the id, balance, and date (formatted as need be) into a new Bank Account object
      accounts_csv.each do |id, balance, date|
        balance = balance.to_f.round(2)/100
        date = DateTime.strptime(date, "%Y-%m-%d %H:%M:%S %z")
        id = Bank::Account.new(id, balance ,date)
        # Push the new account into the @accounts array
        @accounts.push(id)
      end
      return @accounts
    end

    # Finds the account with the ID that matches the passed parameter and returns the instance
    def self.find(id_search)
      # Looks in @accounts array for a matching ID value
      found = @accounts.find do |account|
        account.id == id_search.to_s
      end
      return found
    end

    # Links owners with accounts
    def self.link_owner
      # Creates Account and Owner arrays (calls Account and Owner self.all methods)
      self.all
      Bank::Owner.all
      accounts_with_owners = []
      account_owners_csv = CSV.read("support/account_owners.csv")
      # for each row in the
      account_owners_csv.each do |row|
        account = self.find(row[0])
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
        account.id == id_search.to_s
      end
      return found.current_balance
    end
          # end of extra work #
# ----------------------------------------#

    # Method for withdrawing from account
    def withdraw(orig_amount_to_withdraw)
      amount_to_withdraw = orig_amount_to_withdraw + @fee
      # check if the requested withdrawal is more than the minimum balance
      if (@balance - amount_to_withdraw) < @min_balance
        # If we are dealing with a MoneyMarket account, we do special withdrawal behavior
        # Keeping this here instead of in Money Market prevented us from having to rewrite an entire withdraw function for Money Market (we can just super the Account method)
        if @acct_type == "MoneyMarket"
          # Checks that the withdrawal won't put you below 0 or if you are no longer allowed to withdraw
          if (@balance - amount_to_withdraw - @money_market_fee) < 0 || @allowed_to_withdraw == false
            puts "Sorry you cannot make that withdrawal without depositing more money."
          else
            # If the withdrawal goes below min balance a fee is imposed and no further withdrawals are permitted
            puts "As this transaction puts your balance below $#{@min_balance.round(2)}, a fee of $#{@money_market_fee.round(2)} has been imposed."
            @balance -= (amount_to_withdraw + @money_market_fee)
            puts "Your balance is $#{@balance.round(2)}"
            @allowed_to_withdraw = false
          end
        else
          # If account is not Money Market, normal withdrawal behavior for attempting to withdraw too much
          puts "The requested withdrawal is more than the available funds."
          # Works for all account types, min balance and fee vary by account type
          if (@balance-@min_balance-@fee) < 0
            puts "You have no money left to withdraw."
          else
            puts "You only have $#{(@balance-@min_balance-@fee).round(2)} available for withdrawal."
          end
        end
        return @balance
      else
        # makes the withdrawal and displays info to the user
        @balance -= (amount_to_withdraw)
        puts "You have withdrawn $#{orig_amount_to_withdraw.round(2)}"
        if @fee != 0
          puts "You have also incurred a $#{@fee.round(2)} fee."
        end
        puts "Your current balance is $#{@balance.round(2)}"
        return @balance
      end
    end


    # Method for depositing into account
    def deposit(amount_to_deposit)
      # Makes the deposit and displays info to the user
      @balance += amount_to_deposit
      puts "You have deposited $#{amount_to_deposit.round(2)}."
      puts "Your current balance is $#{@balance.round(2)}."
      # Special case to allow Money Market account to make withdrawals again
      if @acct_type == "MoneyMarket" && @balance > min_balance
        @allowed_to_withdraw = true
      end
      return @balance
    end

    # Displays current balance in the account
    def current_balance
      puts "The account with ID #{@id} currently has a balance of $#{@balance.round(2)}."
      puts "This account was set up on #{@open_date}"
    end

    def add_interest(rate)
      # Add interest only runs for the MoneyMarket and Savings account
      if @acct_type == "MoneyMarket" || @acct_type == "Savings"
        interest =  @balance * rate/100
        @balance += interest
        puts "After adding interest, the balance is now $#{@balance.round(2)}"
        return interest
      else
        puts "This type of account does not accumulate interest."
      end
    end

  end
end
