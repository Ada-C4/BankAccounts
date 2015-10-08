module Bank
  class CheckingAccount < Account


    def withdraw (amount)
      super (amount, 1)
    end


    #   if amount + FEE > @balance
    #     puts "You have $#{@balance} in your account. Wirg 4! fee"
    #     puts "The maximun amount you can draw is #{@balance + 1} pennies"
    #   else
    #       puts "There is a $1 fee for each withdraw. Would you like to continue?"
    #       answer = gets.chomp.downcase
    #       if answer == y || answer == yes
    #         puts "You had $#{@balance/100}"
    #         @balance = @balance - amount - FEE
    #         puts "The update account balance is $#{@balance/100}"
    #       else
    #         puts "Ok, Bye!"
    #       end
    #   end
    #   return @balance
    # end
end
end
