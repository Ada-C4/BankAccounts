# Test 1: Account 1 with positive balance

account1 = Bank::Account.new(5000)
puts "Account created with #{account1.id}"
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


# Test 3: Account 2 with negative balance
puts ("*") * 30
account2 = Bank::Account.new(-5000)
puts "Account created with #{account2.id}"
account2.print_balance
