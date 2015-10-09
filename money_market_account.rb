module  Bank

  class MoneyMarketAccount < Account
    attr_reader :balance, :owner, :account_id, :owner_id, :good_standing, :max_trans

    MIN_BALANCE = 1000000

    def initialize(id, initial_balance, open_date)
      super
      @max_trans = 0
      @good_standing = true
    end

    def withdraw(amount)
      new_balance = @balance - amount
      if @max_trans >= 6 || @good_standing == false
        puts "No more transactions available."
      elsif amount < 0
        puts "You can't withdraw a negative amount."
      elsif new_balance < MIN_BALANCE
        @balance = @balance - amount - 10000
        @good_standing ==  false
        puts "Next time you need to deposit enouhg money to bring your account up to #{MIN_BALANCE}"
        @max_trans += 1
      else
        @max_trans += 1
        @balance = new_balance
        return @balance
      end
    end

    def deposit(amount)
      if @balance < 1000000
        super(amount)
      else
        super(amount)
        @max_trans += 1
      end
      if @balance > 1000000
        @good_standing == true
      end
    end

    def reset_transactions
      @max_trans
    end

  end

end
