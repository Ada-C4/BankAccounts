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

# responses not fully sanitized...
print "Would you like to set up your account owner information today? (enter yes or no) "
response = gets.chomp.downcase
if response == 'yes'
  owner_hash = Hash.new()
  # Not sanitized yet
  print "What is your first name? "
  owner_first_name = gets.chomp
  print "What is your last name? "
  owner_last_name = gets.chomp
  print "What is your street? "
  owner_street = gets.chomp
  print "What is your city? "
  owner_city = gets.chomp
  print "What is your state? "
  owner_state = gets.chomp
  print "What is your zip code? "
  owner_zip = gets.chomp

  owner_hash[:first_name] = owner_first_name
  owner_hash[:last_name] = owner_last_name
  owner_hash[:street] = owner_street
  owner_hash[:city] = owner_city
  owner_hash[:state] = owner_state
  owner_hash[:zip_code] = owner_zip

  new_owner_info = Bank::Owner.new(owner_hash)
  new_account.add_owner(new_owner_info)

  puts "Thanks #{owner_hash[:first_name]}. You successfully added your owner information."

else
  puts "Come back another time to enter your account owner information."
end

# already defined owner hash for testing purposes
#owner_hash = {first_name: "Jessica", last_name: "Noglows", street: "2nd Ave", city: "Seattle", state: "WA", zip_code: 98121}
