require 'pry'
require 'csv'
require './Bank_Account.rb'
require './Savings_account.rb'

# require ./support/accounts.csv
accounts_csv = CSV.read("./support/accounts.csv")
owners_csv = CSV.read("./support/owners.csv")
account_owners_csv = CSV.read("./support/account_owners.csv")

#make a bank account manually
acct = Bank::Account.new(1212, 1235667, "1999-03-27 11:30:09 -0800")


#withdraw money
acct.withdraw(20)

#deposit money
acct.deposit(1)

#check amount in account
acct.check_balance


lizzie = Bank::Owner.new(123, "Borden", "Lizzie", "453 Magpie Lane", "Wilhelm", "MA")

acct.add_owner(lizzie)

#make an entire array of accounts using the account csv, and then return it
Bank::Account.generate_accounts(accounts_csv)
Bank::Account.all

new_acct = Bank::Account.new(1217, 123000067, "1999-03-27 11:30:09 -0700")
Bank::Account.all
Bank::Account.find(1217)


Bank::Owner.generate_owners(owners_csv)
Bank::Owner.all
Bank::Owner.find(15)
puts "line 41ish"

#now pair up the owners and accounts
# Bank::Account.match_account_to_owner(account_owners_csv)
# Bank::Account.all

newsavings = Bank::SavingsAccount.new(23232, 3546345234,"1999-03-27 11:30:09 -0700")
Bank::Account.all
puts "line 49ish"
puts newsavings.balance.to_s
