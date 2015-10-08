#require "./bank_accounts.rb"

module Bank
  class SavingsAccount < Account
      def initialize(id, initial_balance, open_date, owner = nil)
        @id = id
        @balance = initial_balance
        @min_balance = 1000
        @open_date = open_date
        @owner = owner
        check_balance
      end

      def withdraw(amount)
        transaction_fee = 200
        return super(amount + transaction_fee)
      end

      def add_interest(rate)
        interest = @balance * (rate/100)
        balance += interest
        return interest
      end
  end
end
