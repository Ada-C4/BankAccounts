# require "./bankaccounttest.rb"
# require "./bankrequirefiles.rb"
module Bank
  class CheckingAccount < Account
    def initialize(id, balance)
      super
      @checks_written = 0
      if @balance < 1000
        raise ArgumentError.new("An initial deposit of at least ten dollars (1000 cents) is required to open an account.")
      end#end of if balance in the initialize method
    end#end of def initialize method

    def withdrawal(amount)
      super
      # if amount > @balance
      #   puts "Cannot perform withdrawal because the account will become negative"
      #   print @balance
      # else
      @balance -= (amount + 100)
        puts "Your new balance is #{@balance}, which includes a $1 (100 cent) withdrawal fee."
      # end of if amount > @balance block
    end#end of withdrawal method

    def withdrawal_using_check(check_amount)
      if check_amount > (@balance - 1000)
        puts "Cannot perform transaction because the check amount is greater than the balance amount by ten dollars below zero."
      else
        if @checks_written < 3
          @balance -= (check_amount)
          puts "Your new balance is #{@balance}."
          @checks_written += 1
        else
          @balance -= (check_amount + 200)
          puts "Your new balance is #{@balance}, which includes a $2 (200 cent) check withdrawal fee."
        end#end if if @checks_written block
      end#end of if @check_amount block
    end#edn of def withdrawal_using_check method

    def reset_checks
      @checks_written = 0
    end#end for reset checks method
  end#end for class
end#end for module
