module Bank
  require "./account.rb"
  class CheckingAccount < Account

    attr_accessor :num_checks

    def initialize(id, date)
      super
      @num_checks = 0
    end

    def withdraw(amount)
      super(amount, 100, 0)
    end

    def withdraw_using_check(amount)
        if @balace < (amount - 100) # $10 in cents
          raise ArgumentError.new("The account can't go into overdraft up to -$10")
        elsif @num_checks > 3
          puts "Since you used more then 3 checks this month- you'll be charged with $2 fee"
          @balance = @balance - 200 - amount
          @num_checks += 1
        else
          @balance = @balance - amount
        end
        puts " Your current balance is $#{@balace/100}"
    end

    def reset_checks
      @num_checks = 0
    end
  end
end
