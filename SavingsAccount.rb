require './Account'
module Bank
  class SavingsAccount < Account

        attr_accessor :name, :balance
        def initialize (name, initial_balance)
          @name = name
          @balance= initial_balance
          if @balance < 10
            raise ArgumentError.new ("You must start an account with more funds than $0")
          else
            puts "Welcome, #{@name}.  Thank you for opening a new account. Your balance is $#{@balance}"
          end
        end

        def withdraw (withdrawal_amount)
          super
            @balance = @balance - withdrawal_amount - 2
            puts "You withdrew $#{withdrawal_amount}. Your new balance is $#{@balance}."
          if @balance <= 10 #double check this. Want to check first before going forward.
            raise ArgumentError.new ("You cannot withdraw below a $10 minimum balance.  Your balance is #{@balance}.")
          end
          return @balance
        end


        def balance
          return @balance
        end

        def deposit (deposit_amount)
          if deposit_amount > 0
            @balance = @balance + deposit_amount
            puts "You deposited $#{deposit_amount}.  Your new balance is $#{@balance}."
          end
          return @balance
        end

        def add_interest
          rate = 0.25
          interest_rate= @balance * rate/100
          return interest_rate
        end
  end
end
