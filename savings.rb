module Bank

  class SavingsAccount < Account

    def withdraw(withdraw_amount)
      if withdraw_amount > @balance - 1000
        puts "Warning: Balance may not go under $10.00. Transaction terminated."
        return @balance
      else
        @balance -= withdraw_amount + 200
        return @balance
      end
    end
  end

end


# def withdraw(withdraw_amount)
#   if withdraw_amount > @balance
#     puts "Warning: Can not withdraw more than is in account. Transaction terminated."
#     return @balance
#   else
#     @balance -= withdraw_amount
#     return @balance
#   end
# end
