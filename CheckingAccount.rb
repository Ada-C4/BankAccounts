require './Account'
module Bank
  class Checking < Account
    def initialize (name, initial_balance)
    super
    @check_count= check_count

    def withdraw
      if withdrawal_amount > @balance
        puts "You have insufficient funds. You have $#{@balance} in your account."
      elsif withdrawal_amount > 0
        @balance = @balance - withdrawal_amount
        puts "You withdrew $#{withdrawal_amount}. Your new balance is #{@balance}."
        @balance = @balance - 1
        puts "You were also charged a $1 transaction fee. Your new balance is $#{@balance}."
      elsif withdrawal_amount <= @balance
        raise ArgumentError.new ("You have insufficient funds. Your account will be overdrawn if this transaction is made.")
        return @balance
      end
    end

      def withdraw_using_check(check_amount)
      @check_count = 3
      @balance = @balance - check_amount
      @check_count -= 1
        if @balance <= -10
          raise ArgumentError.new ("You cannot have an overdraft of more than $10.")
        elsif @check_count == 0
        @balance = @balance - 2
          puts "You have used your 3 free check uses this month.  You have been charged a $2 transaction fee."
          @check_count = 3
        end
        return @balance
      end
    end
  end
