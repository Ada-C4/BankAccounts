require './BankAccounts.rb'
class SavingsAccount < Bank::Account
  def initialize(ident, balance, open_date)
    @ident = ident.to_i
    @balance = balance.to_i
    @min_balance = 1000
    check_valid_balance
    @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %z")
  end
  def withdraw(amount)
    if amount > (@balance - @min_balance - 200)
      puts "You must maintain a $10 minimum balance!"
      return @balance
    else
      super
      @balance -= 200
    end
  end
  def add_interest(rate)
  end
end

#savings = SavingsAccount.new("1212", "1001", "1999-03-27 11:30:09 -0800")
