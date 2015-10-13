require './BankAccounts.rb'
class CheckingAccount < Bank::Account
  attr_reader :check_count
  def initialize(ident, balance, open_date)
    super
    @check_count = 0
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
        @balance -= (amount + 100)
        @check_count += 1
      else
        @balance -= (amount + 300)
      end
      return @balance
    end
  end
  def reset_checks
    @check_count = 0
  end
end
