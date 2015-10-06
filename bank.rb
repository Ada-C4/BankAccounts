module Bank

class Account

attr_accessor :balance, :id

def initialize
  @balance = initial_balance
  @id = 124
end


def initial_balance
  puts "Welcome to Ada Bank!"
  puts "How much money would you like to deposit to your new account ?"
  money = gets.chomp.to_i
  if money < 0
    raise ArgumentError.new("You can't deposit negativ amount of money")
    retuern 0
  elsif
    money == 0
    puts "You have 30 days to deposit at least $5"
  end
  return money
end


def withdraw (amount)
  if amount > @balance
    puts "The maximun amount you can draw is $#{@balance}"
  else
  puts "Ypu had $#{@balance}"
  @balance = @balance - amount
  puts "The update account balance is $#{@balance/100}"
  end
end

def deposit (amount)
  if amount < 0
    puts "If you want to withdraw, that's a different method :)"
  else
  @balance = @balance + amount
  puts "After you deposited $#{amount/100}"
  puts "The update account balance is $#{@balance/100}"
  end
end

def print_balance
  puts "Your current balance is $#{@balance}"
end


end
end
