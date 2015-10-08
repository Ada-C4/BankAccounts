require './lib/savings'
require './lib/checking'

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
checking = Bank::CheckingAccount.new(1, -100)
checking.print_balance
