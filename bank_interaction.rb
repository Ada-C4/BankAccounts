require './bank.rb'

#print "What would you like your User ID to be? "
# NEED TO SANITIZE
#user_id = gets.chomp
user_id = "jessica"

#print "How much will you be depositing as your initial balance? "
# NEED TO SANITIZE
#initial_deposit = gets.chomp.to_i
initial_deposit = 4000

new_account = Bank::Account.new(user_id,initial_deposit)


new_account.deposit(100)
new_account.withdraw(200)
new_account.current_balance
