# figure out how to add to Bank module

class Account
  attr_reader :balance, :account_id, :owner, :all_accounts, :open_date

  def initialize(id, balance, open_date)

    if balance.to_i < 0
      raise StandardError, "You cannot open an account in debt."
    end

    @account_id = id
    @balance = balance
    @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %Q")
  end

  def withdraw(withdraw_amt)
    while (@balance - withdraw_amt) < 0
      puts "You cannot overdraft your account. Your current balance is #{@balance} cents"
      puts "Please enter a new withdrawl amount: "
      withdraw_amt = gets.chomp.to_i
    end

    @balance -= withdraw_amt
    puts "Your previous account balance was #{@balance + withdraw_amt} cents."
    puts "It is now #{@balance} cents."
  end

  def deposit(deposit_amt)
    @balance += deposit_amt
    puts "Your previous account balance was #{@balance - deposit_amt} cents."
    puts "It is now #{@balance} cents."
  end

  def show_balance
    puts "Your current balance is #{@balance} cents"
  end

  def assign_owner(first_name, last_name, address)
    @owner = Bank::Owner.new(first_name, last_name, address)
  end

  def self.all
    @all_accounts = []

    CSV.read("./support/accounts.csv").each do |line|
      y = Bank::Account.new(line[0].to_i, line[1].to_i, line[2])
      @all_accounts.push(y)
    end

    return @all_accounts
  end

  def self.find(id)
    Bank::Account.all.find do |account_instance|
      account_instance.account_id == id
    end
  end
end
