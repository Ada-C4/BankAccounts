require 'csv'

module Bank
  class Account
    attr_accessor :id, :balance, :amount

    # :file
    @@number_of_accounts = 0

    def initialize(id, balance)
      # account_array = CSV.read("./support/accounts.csv")
      # @id = account_array[@@number_of_accounts][0]
      # @balance = account_array[@@number_of_accounts][1]
      # @opendate = account_array[@@number_of_accounts][2]
      # @opendate = opendate
      # @account_id = account_id
      @id = id
      @balance = balance.to_i
      # @fee = fee
      @amount = amount.to_i
      if @balance < 0
        raise ArgumentError.new("Cannot create a new account with a negative balance")

      else
         puts "You deposited #{@balance} dollars."
         puts "Your new balance is #{@balance} dollars."
      end
      # @@number_of_accounts += 1
    end #end statement for initialize method begining on line 10

    def withdraw(amount)
      # puts "Type the amount you would like to withdraw:"
      # @amount = gets.chomp.to_i
      if @balance - amount.to_i < 0
        puts ("Cannot withdraw an amount that will make the balance negative.")
        puts "Your current balance is #{@balance}."
      else
        @balance  -= amount.to_i
        puts "Your new balance is: #{@balance} dollars."
      end#end statment for the if/else beginning on line 32
    end#end for withdraw method beginning on line 29

    def deposit(amount)
      # puts "Type the amount you would like to deposit:"
      # @amount = gets.chomp.to_i
      @balance += amount.to_i
      puts "Your new balance is #{@balance} dollars."
    end#end statement for deposit method beginning on line 41

    def balance
      puts @balance
    end #end for balance method begining on line 48

    def self.all
      @@number_of_accounts = 0
      all_accounts_array = []
      account_array = CSV.read("./support/accounts.csv")
      while @@number_of_accounts < account_array.length do
        account_name = "Account" + @@number_of_accounts.to_s
        account_name = Account.new()
        all_accounts_array.push(account_name)
      end
      return all_accounts_array
    end#end statement for self.all method beginning on line 52

    def self.find(id)
      account_array = self.all
      # print account_array
      return account_array.find {|i| i.id == id.to_s}
    end

  end#end for the account class on line 4

end #end for the bank module begining on line 3

    # def self.find(id)
    #   @file.find do

      # end
#       end
#     end
#
#   end
# end
#extra code



# @default_account_amount = 0
# puts "Your default account balance is $0. Please enter the amount you wish to deposit in whole dollars:"
# @user_deposit  = gets.chomp
# @integer_user_deposit = @user_deposit.to_i
#   if @integer_user_deposit >= 0
#     beginning_account_amount = @default_deposit_amount.to_i + @integer_user_deposit
#     puts "You deposited #{@integer_user_deposit} dollars."
#     puts "Your new balance is #{beginning_account_amount} dollars."
#   else
#     raise ArgumentError, "Please enter an amount that is greater than zero."
#     @user_deposit = gets.chomp
#   end
