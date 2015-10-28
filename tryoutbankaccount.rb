require 'csv'
# def show_all_accounts
s = CSV.read("./support/accounts.csv")
print s
# print s[-1]
