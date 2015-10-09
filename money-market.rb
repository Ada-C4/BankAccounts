module Bank
  class MoneyMarketAccount < Account
    attr_reader :transactions_permitted, :transaction_count, :balance

    @@min_balance = 1000000

    def initialize(ident, open_date, balance)
      super
      @transaction_count = 0
      @transactions_permitted = true      # this only refers to minimum balance concerns, not to transaction count
    end

    def withdraw(withdraw_amount)
      if @balance - withdraw_amount < 0                         # balance can never go negative
        puts "Insufficient new balance. Withdraw denied."
        @balance
      elsif @balance - withdraw_amount < @@min_balance && @transactions_permitted
        @transactions_permitted = false
        @balance = @balance - withdraw_amount - 10000
      elsif
        @transaction_count < 6 && @transactions_permitted
        @transaction_count += 1
        @balance -= withdraw_amount
      else
        @balance
      end
    end

    def deposit(deposit_amount)
      if !@transactions_permitted
        @balance += deposit_amount
          if @balance >= @@min_balance
            @transactions_permitted = true
            @balance
          else
            @transactions_permitted = false
            @balance
          end
      elsif @transaction_count < 6
        @transaction_count += 1
        @balance += deposit_amount
      else
        @balance
      end
    end

    def reset_transaction_count
      @transaction_count = 0
    end

    def add_interest(rate)
      interest = @balance * rate/100
      @balance += interest
      return interest
    end

  end
end
