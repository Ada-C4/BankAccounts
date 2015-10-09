module Bank
  require 'pry'
  require 'csv'

  class CheckingAccount < Account
    attr_reader :checks

    def initialize (account_id, balance, open_date, owner = nil)
      super(account_id, balance, open_date, owner = nil)
      @withdrawalfee = 1
      @withdrawalfee_nochecks = 2
      @checks = 3
    end

    def withdraw_using_check(withdrawal_amount)
      #I'm assuming that a withdrawal with a free check incurs $0 transaction fee, unlike regular withdrawals
      if @checks > 0
        if withdrawal_amount > (@balance + 10)
          reject_withdrawal
        else
          @checks -= 1
          @balance -= withdrawal_amount
          puts "\nBalance after withdrawal: #{@balance}\n"
          puts @checks
          return @balance
        end
      #if you don't have checks
      else
        if (withdrawal_amount + @withdrawalfee_nochecks) > (@balance + 10)
          reject_withdrawal
        else
          @balance -= withdrawal_amount + @withdrawalfee_nochecks
          puts "\nBalance after withdrawal: #{@balance}\n"
          return @balance
        end
      end
    end


    def reset_checks
      @checks = 3
    end
  end
end
