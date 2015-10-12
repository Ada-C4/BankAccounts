module Bank
  class CheckingAccount < Account

    FEE = 100

    def initialize(id, initial_balance)
      super

      @checks = 0
      puts "Thank you for opening a Checking Account with Daphne's Bank.".colorize(@colors_array[rand(0..@colors_array.length-1)])
      puts "___Account Summary___".colorize(@colors_array[rand(0..@colors_array.length-1)])
      puts "Account ID: #{@id}"
      puts "Initial balance: #{Money.new(@balance, "USD").format}\n\n"
      puts "Each withdrawal incurs a fee of $1 that is taken out of the balance. Checking accounts may not overdraw except for check withdrawals, which allow account holders to overdraw a maximum of $10. Account holders are allowed three free checks per month, but any subsequent use incurs a $2 transaction fee."
    end

    def withdraw_using_check(withdrawal)
      if withdrawal <= 0
        print "You can only withdraw a positive amount. "

        return @balance
      end

      if (@balance - withdrawal < -1000 && @checks <= 3) || (@balance - withdrawal - 200 < -1000 && @checks > 3)
        print "You cannot overdraft your account more than $10. "
      else
        @balance -= withdrawal
        @checks += 1
        @balance -= 200 if @checks > 3
        puts "___Check Withdrawal Receipt___".colorize(@colors_array[rand(0..@colors_array.length-1)])
        puts "You withdrew: #{Money.new(withdrawal, "USD").format}"
        puts "Number of checks this period: #{@checks}"
        puts "Fees: #{Money.new(200, "USD").format}" if @checks > 3
        puts "Your balance: #{Money.new(@balance, "USD").format}"
      end

      return @balance
    end

    def reset_checks
      @checks = 0
    end

  end
end
