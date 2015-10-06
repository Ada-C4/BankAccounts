require "./Bank_Account.rb"

#make a bank account
acct = Bank::Account.new(121212, 10)


#withdraw money
acct.withdraw(20)

#deposit money
acct.deposit(1)

#check amount in account
acct.check_balance
