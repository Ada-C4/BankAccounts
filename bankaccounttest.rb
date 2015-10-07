module Bank
  class Account
    attr_accessor :account_id, :account_balance, :amount

    def initialize(account_id, account_balance = 0)
      @account_id = account_id
      @account_balance = account_balance.to_i
      @amount = amount.to_i
      if @account_balance < 0
        raise ArgumentError.new("Cannot create a new account with a negative balance")

      else
         puts "You deposited #{@amount} dollars."
         puts "Your new balance is #{@account_balance} dollars."
      end
    end

    def withdraw
      puts "Type the amount you would like to withdraw:"
      @amount = gets.chomp.to_i
      if @account_balance - @amount < 0
        puts ("Cannot withdraw an amount that will make the balance negative.")
        puts @account_balance
      else
        @account_balance  -= @amount
        puts "Your new balance is: #{@account_balance} dollars."
      end
    end

    def deposit
      puts "Type the amount you would like to deposit:"
      @amount = gets.chomp.to_i
      @account_balance += @amount
      puts "Your new balance is #{@account_balance} dollars."
    end

    def balance
      puts account_balance
    end

  end
end
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
