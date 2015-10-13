require "./bank_account"
require "./savings_and_checking"

# m = Bank::MoneyMarketAccount.new(1212, 1200000, "06291990")
# 6.times do
#   m.withdraw(5000)
# end
#
# m.withdraw(4000)
#
# m.deposit(1000)

# #SAVINGS ACCOUNT CHECKS
#  s = Bank::SavingsAccount.new(1212, 2000, "06291990")
# 2.times do
#   s.withdraw(200)
# end
#
# s.add_interest(0.25)

#CHECKING ACCOUNT CHECKS
# c = Bank::CheckingAccount.new(1212, 2000, "06291990")
# c.withdraw(1000)
#
# 4. times do
#   c.withdraw_using_check(300)
# end
#
# c.withdraw_using_check(600)

#MONEYMARKETACCOUNT CHECKS
m = Bank::MoneyMarketAccount.new(1212, 1000000, "06291990")
m.withdraw(5000)
m.deposit(1000000)

5.times do
  m.deposit(100)
end

m.withdraw(5000)
