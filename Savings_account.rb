
module Bank
  require 'pry'
  require 'csv'
  class SavingsAccount < Account
    # The initial balance cannot be less than $10. If it is, this will raise an ArgumentError
    def confirm_initial_balance
      if @balance < 10 #Can improve on this later
        raise ArgumentError.new("Balance must be integer value 10 or greater.")
      end
    end

    def withdraw(withdrawal_amount)
      # print "\nEnter value to be withdrawn: "
      # withdrawal_amount = gets.chomp.to_i
      if withdrawal_amount > (@balance - 12)
        puts "\nWithdrawal denied."
        puts "Balance: #{@balance}\n"
        return @balance
      else
        @balance = @balance - (withdrawal_amount + 2)
        puts "\nBalance after withdrawal: #{@balance}\n"
        return @balance
      end
    end

  end
end
