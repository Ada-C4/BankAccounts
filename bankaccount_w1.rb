module Bank

require 'csv'

  class Account

    attr_accessor :balance, :account_id, :owner

    def initialize(account_id, balance, datetime_open, owner = nil)
      @account_id = account_id
      @balance = balance
      if balance < 0
        raise ArgumentError.new("Cannot start an account with a negative balance.")
      end
      @datetime_open = datetime_open # DateTime.strptime(datetime_open, "%Y-%m-%d %H:%M:%S %z")
      @owner = owner
    end

    def self.all
      accounts_csv = CSV.read("./support/accounts.csv")
      accounts_instances = []
      accounts_csv.each do |row|
        accounts_instances.push(Account.new(row[0], row[1].to_i, row[2]))
      end
      return accounts_instances
    end

    def self.find(id)
        self.all.find do |line|
        line.account_id.to_i == id
      end
      # new_account = Account.new(matched_id[0], matched_id[1], matched_id[2])
      # puts new_account
    end

    def self.everything
      account_owners_csv = CSV.read("./support/account_owners.csv")
      everything_array = []
      account_owners_csv.each do |line|
        each_account = self.find(line[0].to_i)
        each_owner = Bank::Owner.find(line[1].to_i)
        each_account.owner = each_owner
        everything_array.push(each_account)
      end
      return everything_array
    end

    def withdraw(withdraw_amount)
      # returns updated balance
      withdraw_amount = gets.chomp.to_i
      while withdraw_amount.abs > @balance
        # raise ArgumentError.new("Cannot withdraw more than is in account.")
        puts "Not enough money in account"
        puts "The current balance is: #{@balance}"
        withdraw_amount = gets.chomp.to_i
      end

        @balance = @balance - withdraw_amount.abs

        puts "Your updated balance is: #{@balance}"
    end

    def deposit(deposit_amount)
      # returns updated balance
      @balance = @balance + deposit_amount
      puts "Your updated balance is: #{@balance}"
    end

    # def assign_owner(owner_hash)
    #   @owner = owner
    #   # puts "The owner of this account is #{@owner.first_name} #{@owner.last_name}."
    # end
  end

  class Owner

    attr_reader :owner_id, :first_name, :last_name, :street, :city, :state, :zip

    def initialize(owner_hash)
      @owner_id = owner_hash[:owner_id]
      @first_name = owner_hash[:first_name]
      @last_name = owner_hash[:last_name]
      @street = owner_hash[:street]
      @city = owner_hash[:city]
      @state = owner_hash[:state]
      @zip = owner_hash[:zip]
    end

    def self.all
      owners_csv = CSV.read("./support/owners.csv")
      owners_array = []
      owners_csv.each do |row|
        owner_hash = {:owner_id => row[0], :last_name => row[1], :first_name => row[2], :street => row[3], :city => row[4], :state => row[5]}
        owners_array.push Owner.new(owner_hash)
      end
      return owners_array
    end

    def self.find(id)
      self.all.find do |line|
        line.owner_id.to_i == id
      end
    end

    # def self.everything
    #   account_owners_csv = CSV.read("./support/account_owners.csv")
    #   everything_array = []
    #   account_owners_csv.each do |line|
    #     each_owner = self.find(line[1].to_i)
    #     each_account = Bank::Account.find(line[0].to_i)
    #     each_owner.account = each_account
    #     everything_array.push(each_owner)
    #   end
    #   return everything_array
    # end
  end
end

# BILBO = {
#   :owner_id => 1,
#   :first_name => "Bilbo",
#   :last_name => "Baggins",
#   :street => "Bag End Bagshot Row",
#   :city => "Hobbiton",
#   :state => "Middle Earth",
#   :zip => "na"
# }
