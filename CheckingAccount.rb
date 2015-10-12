module Bank
  class CheckingAccount < Account
      def initialize(id, initial_balance, open_date, owner = nil)
        super
        @num_checks_used = 0
      end

      def withdraw(amount)
        transaction_fee = 100
        return super(amount + transaction_fee)
      end

      def withdraw_using_check(amount)
        min_balance = -1000
        if @num_checks_used >= 3
          amount += 200
        end
        if (@balance - amount < min_balance)
          puts "Your balance cannot be below the minimum amount of $#{min_balance/100}. Transaction terminated."
        else
          @num_checks_used += 1
          @balance -= amount
        end
        return @balance
      end

      def reset_checks
        @num_checks_used = 0
      end
  end
end
