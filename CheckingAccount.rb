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
        min_balance = -10
        if (@balance - amount < -1000)
          puts "Your balance cannot be below the minimum amount of $#{min_balance}. Transaction terminated."
        else
          @balance -= amount
        end
        return @balance
      end
  end
end
