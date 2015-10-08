require './BankAccounts.rb'
class CheckingAccount < Bank::Account
  attr_reader :check_count
  def initialize(ident, balance, open_date)
    super
    @check_count = 0
    @check_fee = 100
  end
  def withdraw(amount)
    amount += 100
    super
  end
  def withdraw_using_check(amount)
    if amount > (@balance + 1000)
      puts "Not enough fundz!"
    else
      if @check_count < 3
        @check_fee = 100
        @balance -= (amount + @check_fee)
        @check_count += 1
      else
        @check_fee = 300
        @balance -= (amount + @check_fee)
      end
      return @balance
    end
  end
  def reset_checks
    @check_count = 0
  end
end
