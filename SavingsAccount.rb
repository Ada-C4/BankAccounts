require './Account'
module Bank
  class SavingsAccount < Account
        MIN = 1000

        def withdraw (withdrawal_amount)

          if @balance <= MIN
            raise ArgumentError.new ("You cannot withdraw below a $10 minimum balance.  Your balance is $#{@balance}.")
          else
            @balance = @balance - 200
            puts "You were also charged a $2 transaction fee. Your new balance is $#{@balance}."
          end
          return @balance
        end

        def add_interest (rate)
          interest_accrued= @balance * rate/100
          @balance = @balance + interest_accrued
          return interest_accrued
        end
  end
end
