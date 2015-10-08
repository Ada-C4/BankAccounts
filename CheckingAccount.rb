module Bank

class CheckingAccount < Account
  class Account

    attr_reader :balance
    # set my deafualt balance to 100
    def initialize(id, balance=100,
        if balance < 0
          raise ArgumentError, "Your balance is negative!"
        end
      @balance = balance
      @opendate = opendate
    end

    def display_account
      # show balance of account at initial start
      # show the account id
      puts @balance
    end

    def withdraw(amount)
      # accepts single parameters that represents the amount to be withdraw
      # return updated balance
      ## balance sets up the method that will subtract the amount from the balance
      ## have the (-) subtracts from the set from below variable
      @balance -= amount
      puts @balance
      if @balance - amount < 0
        puts "You have a negative balance!"
        puts "Please deposit money into your account."
      end
    end


    def deposit(amount)
      # accept single parameter that represents the amount of money to be depostied
      @balance += amount
      # should return updated account balance
      puts @balance
    end

end
end
