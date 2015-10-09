require './Account'

module Bank
  class Checking < Account
    def initialize (name, initial_balance)
      super
        @check_count = 3

    end

    def withdraw (withdrawal_amount)
      if withdrawal_amount > @balance
        puts "You have insufficient funds. You have $#{@balance} in your account."
      elsif withdrawal_amount > 0
        @balance = @balance - (withdrawal_amount + 100)
        puts "You withdrew $#{withdrawal_amount}. Your new balance is $#{@balance}."
        puts "You were also charged a $1 transaction fee."
      elsif withdrawal_amount <= @balance
        raise ArgumentError.new ("You have insufficient funds. Your account will be overdrawn if this transaction is made.")
         #what is the difference in this location?
      end
      return @balance
    end

    def withdraw_using_check(check_amount)
      if @balance - check_amount < -1000
        raise ArgumentError.new ("You cannot have an overdraft of more than $10.")
      end

      if @check_count > 0
        @check_count -= 1
        @balance = @balance - check_amount
        puts "You withdrew #{check_amount}. You have #{@check_count} checks to use for withdrawal this month. Your balance is #{@balance}."
      else
        @balance = @balance - (check_amount + 200)
        puts "You have used your 3 free check uses this month.  You have been charged a $2 transaction fee."
      end
      return @balance
    end
  end
end
