require 'pry'
require 'csv'
# accounts_csv = CSV.read("./support/accounts.csv")

module Bank

  class Account

    @@account_list = []

    attr_reader :account_id, :balance, :open_date, :owner

    def initialize(account_id, balance, open_date, owner = nil)
      @account_id = account_id
      @balance = balance.to_i
      @open_date = open_date
      @owner = owner
      @@account_list.push(self)
      confirm_initial_balance
      account_info
    end

    def confirm_initial_balance
      if @balance < 0 #Can improve on this later
        raise ArgumentError.new("Balance must be integer value 0 or greater.")
      end
    end

    def account_info
      puts "\n     Account ID: #{@account_id}"
      puts "Initial Balance: #{@balance}"
    end

    def add_owner(owner) #adds owner from an existing owner, rather than making a new owner
      @owner = owner
      puts "\n#{@owner.name} is now the owner of account \##{@account_id}.\n"
    end

    def withdraw(withdrawal_amount)
      # print "\nEnter value to be withdrawn: "
      # withdrawal_amount = gets.chomp.to_i
      if withdrawal_amount > @balance
        puts "\nWithdrawal denied."
        puts "Balance: #{@balance}\n"
        return @balance
      else
        @balance = @balance - withdrawal_amount
        puts "\nBalance after withdrawal: #{@balance}\n"
        return @balance
      end
    end

    def deposit(deposit_amount)
      # print "\nEnter value to be deposited: "
      # deposit_amount = gets.chomp.to_i
      @balance = @balance + deposit_amount
      puts "\nBalance after deposit: #{@balance}\n"
      return @balance
    end

    def check_balance
      puts "\nBalance: #{@balance}\n"
    end

    def self.generate_accounts(account_info) #takes an array, makes an instance for each of the entries in the csv, and push those into the account_list which belongs to the Account class.
      account_info.each do  |a|
        Account.new(a[0], a[1], a[2])
        # @@account_list.push(Account.new(a[0], a[1], a[2]))
      end
    end

    def self.all #returns all of the accounts that currently belong to the account class
      puts "\nThere are currently #{@@account_list.length} accounts."
      # puts @@account_list
      return @@account_list
    end

    def self.find(id) #returns an instance of Account where the value of the id field in the CSV matches the passed parameter
       idmatch = @@account_list.find do |a|
        a.account_id == id
        end
        puts "\n#{idmatch}"
        puts idmatch.balance
    end
  end

  class Owner

    attr_reader :owner_id, :name, :address, :phone_number

    def initialize(owner_id, name, address, phone_number)
      @owner_id = owner_id
      @name = name
      @address = address
      @phone_number = phone_number
      owner_info
    end

    def owner_info
      puts "\n    Owner ID: #{@owner_id}"
      puts "        Name: #{@name}"
      puts "     Address: #{@address}"
      puts "Phone number: #{@phone_number}"
    end

  end



end
