require './lib/savings'
require './lib/checking'
require './lib/mma'

# - Money Market Account Tests -
mma = Bank::MoneyMarketAccount.new(1, 10000000) # Valid MMA account
mma.print_balance
# # Test withdrawing more than 6 times
# 10.times do
#   mma.withdraw(1000000)
# end
#
# mma.reset_transactions

# Test withdrawing to balance below $10,000
4.times do
  mma.withdraw(3300000)
end

# Test depositing and counting transactions below $10,000
2.times do
  mma.deposit(5000000)
end

# # Test Money Market interest
# mma.add_interest(0.25)
# mma.add_interest(1)
#
# mma = Bank::MoneyMarketAccount.new(1, 9999) # Invalid account - not enough funds

# - Normal Account Tests -
# account = Bank::Account.new(1, 100)
# account.print_balance
# account.withdraw(20) # Regular withdrawal
# account.withdraw(1100) # Withdrawing too much

# account = Bank::Account.new(1, -10) # Account below min

# - Savings Account Tests -
# savings = Bank::SavingsAccount.new(1, 100000)
# savings.print_balance
# savings.withdraw(20000) # Regular withdrawal
# savings.withdraw(1000000000) # Withdrawing too much
#
# savings = Bank::SavingsAccount.new(1, 10) # Account below min

# savings.add_interest(1)

# - Checking Account Tests -
# checking = Bank::CheckingAccount.new(1, 10000)
# # checking.print_balance
#
# 5.times do
#   checking.withdraw_using_check(600)
# end
#
# checking.reset_checks
# 2.times do
#   checking.withdraw_using_check(6000)
# end
