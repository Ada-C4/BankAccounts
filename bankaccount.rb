module Bank
  class Account

    attr_reader :account_number, :balance, :owner

    def initialize(starting_balance, owner)
      @account_number = rand(10000000)
      @balance = starting_balance
      if balance < 0
        raise ArgumentError, "Accounts cannot be created with a negative balance!"
      end
      @owner = owner
    end

    def withdraw(amount)
      if amount > @balance
        puts "That's more than you have available in your account! Your account balance is $#{@balance}."
      elsif amount <= @balance
        @balance = @balance - amount
        puts "You have withdrawn $#{amount} and your new account balance is $#{@balance}."
      end
    end

    def deposit(amount)
      @balance = @balance + amount
      puts "You have deposited $#{amount} and your new account balance is $#{@balance}."
    end

    def check_balance
      puts "Your account balance is $#{@balance}."
    end

  end

  class Owner

    attr_reader :first_name, :last_name, :address

    def initialize(first_name, last_name, address)
      @first_name = first_name
      @last_name = last_name
      @address = address
      @owner_id = rand(10000000)
    end
  end

end

puts "Would you like to create a new bank account today? Please enter your first name"
# validate input
first_name = gets.chomp
puts "Now enter your last name"
# validate input
last_name = gets.chomp
puts "Now enter your address"
# validate input
address = gets.chomp
account_owner = Bank::Owner.new(first_name,last_name,address)
puts account_owner
puts "Please enter an amount of money to deposit in your account"
initial_deposit = gets.chomp
while initial_deposit.to_i.to_s != initial_deposit
  puts "That's not a valid number! Please enter an amount of money to deposit"
  initial_deposit = gets.chomp
end
new_account = Bank::Account.new(initial_deposit.to_i,account_owner)
puts new_account
action = "0"
while action != "exit"
  puts "What would you like to do with your account? You may 1. deposit funds 2. withdraw funds 3. check balance 4. exit"
  action = gets.chomp
  if action == "deposit funds"
    puts "How much money would you like to deposit?"
    # validate input
    amount = gets.chomp.to_i
    new_account.deposit(amount)
  elsif action == "withdraw funds"
    puts "How much money would you like to withdraw?"
    # validate input
    amount = gets.chomp.to_i
    new_account.withdraw(amount)
  elsif action == "check balance"
    new_account.check_balance
  elsif action == "exit"
    exit
  else
    puts "That's not a valid action!"
  end
end
