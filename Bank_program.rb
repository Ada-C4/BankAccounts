require "./Bank_Account.rb"

#make a bank account
acct = Bank::Account.new

#withdraw money
acct.withdraw

#deposit money
acct.deposit

#check amount in account
acct.check_balance
