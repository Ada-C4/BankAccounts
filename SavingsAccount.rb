require './Account'
module Bank
  class SavingsAccount < Account

        def initialize (name, initial_balance)
            super
          if @balance < 10
              raise ArgumentError.new ("You must start an account with more funds than $10")
          end
        end

        def withdraw (withdrawal_amount)
          super
          if @balance <= 10 #double check this. Want to check first before going forward.
            raise ArgumentError.new ("You cannot withdraw below a $10 minimum balance.  Your balance is $#{@balance}.")
          else
            @balance = @balance - 2
            puts "You were also charged a $2 transaction fee. Your new balance is $#{@balance}."
          end
          return @balance
        end

        def add_interest
          rate = 0.25
          interest_accrued= @balance * rate/100
          return interest_accrued
        end
  end
end
