require 'csv'
require 'pry'

module Bank
  class Account

    attr_reader :balance, :owner, :id

    def initialize(id, initial_balance, open_date)
      #@account_owner = owner.first_name
      @id = id.to_i
      @balance = initial_balance.to_i/100.0
      @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %z")
      @owner = nil

      # Raises an argument error if the initial balance is less than 0
      if initial_balance.to_i < 0
        raise ArgumentError, "The balance cannot be less than 0."
      end
    end

    def self.all
      @accounts = []
      accounts_csv = CSV.read("support/accounts.csv")
      accounts_csv.each do |id, balance, date|
        id = Bank::Account.new(id,balance,date)
        @accounts.push(id)
      end
      puts @accounts
      return @accounts
    end


    # Displays the account details nicely printed for all the accounts in accounts.csv
    # (Made this on accident and didn't want to let it go to waste!)
    def self.all_print_nice
      #binding.pry
      if @accounts == nil
        puts "There are no accounts."
      else
        @accounts.each do |account|
          account.current_balance
        end
      end
      return
    end

    def self.find(id_search)
      found = @accounts.find do |account|
        account.id == id_search
      end
      return found
    end

    # Finds an account by id and displays the account information
    # (Made this on accident and didn't want to let it go to waste!)
    def self.find_and_display(id_search)
      found = @accounts.find do |account|
        account.id == id_search
      end
      return found.current_balance
    end



    def withdraw(amount_to_withdraw)
      if (@balance - amount_to_withdraw)< 0
        puts "The requested withdrawal is more than the available funds."
        puts "You only have $#{@balance} available for withdrawal."
        return @balance
      else
        @balance -= amount_to_withdraw
        puts "You have withdrawn $#{amount_to_withdraw}."
        puts "Your current balance is $#{@balance}"
        return @balance
      end
    end

    def deposit(amount_to_deposit)
      @balance += amount_to_deposit
      puts "You have deposited $#{amount_to_deposit}."
      puts "Your current balance is $#{@balance}."
      return @balance
    end

    def current_balance
      puts "The account with ID #{@id} currently has a balance of $#{@balance}."
      puts "This account was set up on #{@open_date}"
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

    def print_owner_details
      puts "The owner of this account is #{@first_name} #{@last_name}."
      puts "Street: #{@street_address}"
      puts "City: #{@city}"
      puts "State: #{@state}"
    end

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

    # Displays the owner information in a nice format
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

    def self.find(id_search)
      found = @owners.find do |owner|
        binding.pry
        owner.id == id_search
      end
      return found
    end

    def self.find_and_display(id_search)
      found = @owners.find do |owner|
        owner.id == id_search
      end
      return found.print_owner_details
    end

  end

end
