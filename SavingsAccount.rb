module Bank

  class SavingsAccount < Account

    MIN_BALANCE = 1000
    FEE = 200

      def initialize (account_id, initial_balance, open_date)
        super
      end

      def add_interest(rate)
        interest = @balance * (rate/100)
        @balance += interest
        return interest
      end


  end

end
