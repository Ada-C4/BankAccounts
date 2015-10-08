require "./bank.rb"

class SavingsAccount < Account

  def initialize (id, balance, date)
    super (id, initial_balance, date)
  end

  def initial_balance
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$".center(70)
    puts
    puts "$$$$$$$ Welcome to Tammy's Bank! $$$$$$$".center(70)
    puts "How much $$$ would you like to deposit to your new account ?".center(70)
    puts
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$".center(70)
    money = gets.chomp.to_i
    if money < 10
      raise ArgumentError.new("You can't deposit negativ amount of money")
      money = 0
    elsif money == 0
      puts "You have 30 days to deposit at least $10"
    end
    return money
  end
