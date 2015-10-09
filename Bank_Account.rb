#still have wave two final option prelim code in here as comments

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
      puts "\n#{@owner.first_name} is now the owner of account \##{@account_id}.\n"
    end

    def reject_withdrawal
      puts "\nWithdrawal denied."
      puts "Balance: #{@balance}\n"
      return @balance
    end

    def withdraw(withdrawal_amount, withdrawalcap = @balance)
      # print "\nEnter value to be withdrawn: "
      # withdrawal_amount = gets.chomp.to_i
      if (withdrawal_amount + @withdrawalfee) > withdrawalcap
        reject_withdrawal
      else
        @balance -= withdrawal_amount + @withdrawalfee
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
    end

    # def self.match_account_to_owner(account_owner, Owner.owner_list) #given an array of owners and a file telling use which owner goes with which account, assign an owner to an account
    #   account_owner.each do |a|
    #     account = self.find(a[0]) #gives us the account from the account list that matches the account in account_owner. So now we are dealing with an actual account
    #   Owner.owner_list.each do |a|


      #add owner is a method to be used on an instance, not a class. hmmm.
      #need to use this instance method within a class method
      #so should go through instances to do this
      #look at the account_owner list (starting at 0)
      #account_list, owner_list will be used
      #can just iterate or can find
      #start by looking through account_owner
      #see the account id number
      #see the owner id attached to it
      #find that owner id and add that owner to that account
      #do that using something like the owner method I already have
      # end
      # end

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
    end

  end

end
