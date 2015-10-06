require './bank.rb'

print "What would you like your User ID to be? "
# NEED TO SANITIZE
user_id = gets.chomp
#user_id = "jessica"

print "How much will you be depositing as your initial balance? "
# NEED TO SANITIZE
initial_deposit = gets.chomp.to_i
#initial_deposit = 4000

new_account = Bank::Account.new(user_id,initial_deposit)

owner_hash = {first_name: "Jessica", last_name: "Noglows", street: "2nd Ave", city: "Seattle", state: "WA", zip_code: 98121}

jess = Bank::Owner.new(owner_hash)
new_account.add_owner(jess)
#new_account.add_owner_details(jess2)
#puts "I'm past here"

puts new_account.owner.first_name

new_account.withdraw(10000)
#new_account.
#puts new_account.


#new_account.deposit(100)
#new_account.withdraw(200)
#new_account.current_balance
