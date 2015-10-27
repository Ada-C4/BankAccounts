#{require "./Owner.rb"}
require "csv"

module Bank
  class Account
    @@count_accounts = 0

    attr_accessor :id, :balance, :date, :owner

    def initialize (id, balance, date)
      @balance = balance
      @id = id
      @date = date
      @@count_accounts += 1
      @owner = nil
      #@owner = owner
    end

    def set_owner (owner)
      @owner = owner
    end

    #get a row from index and return a new account
    def self.create_account (person_array)
      account_id = person_array[0].to_i
      account_balance = person_array[1].to_i
      account_date = person_array[2]
      return Bank::Account.new(account_id, account_balance, account_date)
    end

    #read the CSV file and row by row use the "creat account" method to create accounts and
    #push it to an array - and return it
    def self.all
      sample = CSV.read("./support/accounts.csv")
      accounts = []
      sample.each do |row|
        account = create_account(row)
        accounts.push(account)
      end
      return accounts
    end

    def self.find(id)
      sample = CSV.read("./support/accounts.csv")
      sample.find do |row|
        if row[0].to_i == id
          return create_account(row)
        end
      end
    end

  end


    #
    # def initial_balance
    #   puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$".center(70)
    #   puts "$$$$$$$ Welcome to Tammy's Bank! $$$$$$$".center(70)
    #   puts "How much $$$ would you like to deposit to your new account ?".center(70)
    #   puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$".center(70)
#     #   money = gets.chomp.to_i
#     #   if money < 0
#     #     raise ArgumentError.new("You can't deposit negativ amount of money")
#     #     money = 0
#     #   elsif money == 0
#     #     puts "You have 30 days to deposit at least $5"
#     #   end
#     #   return money
#     # end
#
#     def withdraw (amount)
#       if amount > @balance
#         puts "The maximun amount you can draw is #{@balance} pennies"
#       else
#         puts "You had $#{@balance/100}"
#         @balance = @balance - amount
#         puts "The update account balance is $#{@balance/100}"
#       end
#     end
#
#     def deposit (amount)
#       if amount < 0
#         puts "If you want to withdraw, that's a different method :)"
#       else
#         @balance = @balance + amount
#         puts "After you deposited $#{amount/100}"
#         puts "The update account balance is $#{@balance/100}"
#       end
#     end
#
#     def print_balance
#       puts "Your current balance is $#{@balance}"
#     end
#
#   end
# end
#
#
 class Owner

    attr_accessor :id, :last_name, :first_name, :address, :city, :state

    def initialize (info_hash)
      @id = info_hash [:id]
      @last_name = info_hash [:last_name]
      @first_name = info_hash [:first_name]
      @address = info_hash [:address]
      @city = info_hash [:city]
      @state = info_hash [:state]
    end

    def self.create_owner (person_array)
      person_id = person_array[0].to_i
      person_last_name = person_array[1]
      person_first_name = person_array[2]
      person_address = person_array[3]
      person_city = person_array[4]
      person_state = person_array[5]
      owner =   {id: person_id,
                last_name: person_last_name,
                first_name: person_first_name,
                address: person_address,
                city: person_city,
                state: person_state
                }
      return Bank::Owner.new(owner)
    end

    def self.all
      sample = CSV.read("./support/owners.csv")
      owners = []
      sample.each do |row|
        owner = create_owner(row)
        owners.push(owner)
      end
      return owners
    end

    def self.find(id)
      sample = CSV.read("./support/owners.csv")
      sample.each do |row|
        if row[0] == id
          return create_owner(row)
        end
      end
    end


## Why isn't this working??

    def self.owner_account
      sample = CSV.read("./support/account_owners.csv")
      owner_accounts_array =[]
      sample.each do |row|
        account = Bank::Account.find(row[0].to_i)
        owner = Bank::Owner.find(row[1].to_i)
        if account == nil
          break
        else
        account.set_owner(owner)
        owner_accounts_array.push(account)
        end
      end
      return owner_accounts_array
    end
 end
end





#
#
#   nemo_hash = {
#   name: "Nemo",
#   address: "Seattle",
#   job: "Student",
#   id: 1283
#   }
#
#   nemo = Bank::Owner.new(nemo_hash)
#
#   end
# end
