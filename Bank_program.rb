require 'pry'
require './Bank_Account.rb'
require 'csv'
# require ./support/accounts.csv
accounts_csv = CSV.read("./support/accounts.csv")
owners_csv = CSV.read("./support/owners.csv")

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


#now pair up the owners and accounts
