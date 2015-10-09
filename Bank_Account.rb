module Bank
  require 'pry'
  require 'csv'

  class Account

    @@account_list = []

    attr_reader :account_id, :balance, :open_date, :owner

    def initialize(account_id, balance, open_date, owner = nil)
      @account_id = account_id
      @balance = balance.to_i
      @open_date = open_date
      @owner = owner
      @withdrawalfee = 0
      @@account_list.push(self)
      confirm_initial_balance
      account_info
    end

    def confirm_initial_balance
      if @balance < 0
        raise ArgumentError.new("Balance must be integer value 0 or greater.")
      end
    end

    def account_info
      puts "\n     Account ID: #{@account_id}"
      puts "Initial Balance: #{@balance}"
    end

    def add_owner(owner) #adds owner from an existing owner, rather than making a new owner
      @owner = owner
      puts "\n#{@owner.first_name} is now the owner of account \##{@account_id}.\n"
    end

    def reject_withdrawal
      puts "\nWithdrawal denied."
      puts "Balance: #{@balance}\n"
      return @balance
    end

    def withdraw(withdrawal_amount, withdrawalcap = @balance)
      if (withdrawal_amount + @withdrawalfee) > withdrawalcap
        reject_withdrawal
      else
        @balance -= withdrawal_amount + @withdrawalfee
        puts "\nBalance after withdrawal: #{@balance}\n"
        return @balance
      end
    end

    def deposit(deposit_amount)
      @balance = @balance + deposit_amount
      puts "\nBalance after deposit: #{@balance}\n"
      return @balance
    end

    def check_balance
      puts "\nBalance: #{@balance}\n"
    end

    def self.generate_accounts(account_info) #takes an array, makes an instance for each of the entries in the csv, and push those into the account_list which belongs to the Account class.
      account_info.each do |a|
        Account.new(a[0], a[1], a[2])
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
        return idmatch
    end

    def self.match_account_to_owner(account_owner, owner_list = Owner.read_owner_list)
          account_owner.each do |a|
            account = self.find(a[0]) #this is an account object that matches the csv
            #now find owner
            owner = Owner.find(a[1]) #this is the owner object
            account.add_owner(owner) #add the corresponding owner to the account
      end
    end
  end

  class Owner

    @@owner_list = []

    attr_reader :owner_id, :last_name, :first_name, :street_address, :city, :state

    def initialize(owner_id, last_name, first_name, street_address, city, state)
      @owner_id = owner_id
      @last_name = last_name
      @first_name = first_name
      @street_address = street_address
      @city = city
      @state = state
      @@owner_list.push(self)
      owner_info
    end

    def self.read_owner_list
      @@owner_list
    end

    def owner_info
      puts "\n    Owner ID: #{@owner_id}"
      puts "        First name: #{@first_name}"
      puts "    Street address: #{@street_address}"
    end

    def self.generate_owners(owner_info)
      owner_info.each do |a|
      Owner.new(a[0], a[1], a[2], a[3], a[4], a[5])
      end
      puts @@owner_list
    end

    def self.all #returns all of the accounts that currently belong to the account class
      puts "\nThere are currently #{@@owner_list.length} owners."
      return @@owner_list
    end

    def self.find(id) #returns an instance of Account where the value of the id field in the CSV matches the passed parameter
       idmatch = @@owner_list.find do |a|
        a.owner_id == id.to_s
        end
        puts "\n#{idmatch}"
        puts "\n#{idmatch.last_name}"
        return idmatch
    end

  end

end
