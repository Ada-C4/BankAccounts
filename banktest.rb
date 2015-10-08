require './lib/savings'
require './lib/checking'

# - Normal Account Tests -
# account = Bank::Account.new(1, 100)
# account.print_balance
# account.withdraw(20)
# account.withdraw(1100)


# - Savings Account Tests -
savings = Bank::SavingsAccount.new(1, 100000)
savings.print_balance
# savings.withdraw(20000)
# savings.withdraw(1000000000)

savings.add_interest(1)
