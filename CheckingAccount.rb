require './BankAccounts.rb'
class CheckingAccount < Bank::Account
  def withdraw(amount)
    amount += 100
    super
  end
  def withdraw_using_check(amount)
    amount += 100
    if amount > (@balance + 1000)
      puts "Not enough fundz!"
    else
      @balance -= amount
    end
    return @balance
  end
end
