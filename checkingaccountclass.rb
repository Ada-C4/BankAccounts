require "./bankaccounttest.rb"

module Bank
  class CheckingAccount < Account
    def initialize(balance)
      @checks_written = 0
      @balance = balance
      if @balance < 1000
        raise ArgumentError.new("An initial deposit of at least ten dollars (1000 cents) is required to open an account.")
      end
    end

    def withdrawal(amount)
      if amount > @balance
        puts "Cannot perform withdrawal because the account will become negative"
        print @balance
      end
    end

    def withdrawal_using_check

  end
end
