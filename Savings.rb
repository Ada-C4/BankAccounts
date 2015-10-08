module Bank
  # This will inherit behavior from Account class
  attr_reader :id, :balance, :open_date # do I need this?

  class SavingsAccount < Account
    def initialize(id, balance, open_date)
      super
    # if initial balance is < $10, raise ArgumentError
    raise ArgumentError.new("Not Allowed") if balance < 1000
    end

    def withdrawl(amnt_withdrawn) # add withdrawl functionality
      fee_and_withdrawl = amnt_withdrawn + 200  # subtract $2 from balance (add to amnt_withdrawn)
      if @balance - fee_and_withdrawl < 1000 # can't leave your account with less than $10 in it
        # warning message includes untouched balance.
        puts "Don't take out all your money! You gotta keep $10 or more in your savings account. Your balance is #{@balance}."
      else
        super(fee_and_withdrawl) # if 'if' condition is false, run this
      end
    end

    def add_interest(rate)
      interest = @balance * (rate/100) # Calculate interest on the balance
      @balance = @balance + interest # adds interest to balance
      # puts the amount earned in a dollar (not cents) format.
      puts "You earned a measly $#{interest/100} in interest."
    end
  end
end
