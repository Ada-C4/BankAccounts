# Test 1: Account 1 with positive balance

account1 = Bank::Account.new(5000)
puts "Account created with ID ##{account1.id}"
account1.print_balance
puts ("*") * 30
account1.withdraw(3000)

puts ("*") * 30
account1.deposit(3000)

puts ("*") * 30
account1.print_balance

# Test 2: Withdrawing more than the balance
puts ("*") * 30
account1.withdraw(30000000)

# Test 3: Creating an owner
puts ("*") * 30
donald_hash = {
  first_name: "Donald",
  last_name: "Trump",
  address1: "2000 Fashion Show Dr",
  city: "Las Vegas",
  state: "NV",
  zip: "89109",
}
donald = Bank::Owner.new(donald_hash)
puts "New owner created: #{donald.first_name} #{donald.last_name}"

# Test 4: Creating an account with an owner
puts ("*") * 30
account3 = Bank::Account.new(1000000000000, donald)
puts "Account created with owner #{account3.formatted_name}"
account3.print_balance

# Test 5: Changing the owner of an account
puts ("*") * 30
hillary_hash = {
  first_name: "Hillary",
  last_name: "Clinton",
  address1: "1271 6th Ave",
  city: "New York",
  state: "NY",
  zip: "10020",
}

hillary = Bank::Owner.new(hillary_hash)
account1.assign_owner(hillary)

# Test 6: Creating account 2 with negative balance
puts ("*") * 30
account2 = Bank::Account.new(-5000)
puts "Account created with #{account2.id}"
account2.print_balance
