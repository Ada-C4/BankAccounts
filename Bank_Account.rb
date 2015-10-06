module Bank

  class Account

    attr_reader :id, :balance

    def initialize(id, balance)
      @id = id
      @balance = balance
      account_info
    end

    def account_info
      puts "\n     Account ID: #{@id}"
      puts "Initial Balance: #{@balance}"
    end

    def withdraw(withdrawal_amount)
      # print "\nEnter value to be withdrawn: "
      # withdrawal_amount = gets.chomp.to_i
      @balance = @balance - withdrawal_amount
      puts "\nBalance after withdrawal: #{@balance}\n"
      return @balance
    end

    def deposit(deposit_amount)
      # print "\nEnter value to be deposited: "
      # deposit_amount = gets.chomp.to_i
      @balance = @balance + deposit_amount
      puts "\nBalance after deposit: #{@balance}\n"
      return @balance
    end

    def check_balance
      puts "\nBalance: #{@balance}\n"
    end

  end
end
