module Bank

  class Account

    attr_reader :id, :balance

    def initialize(id, balance)
      @id = id
      @balance = balance
      confirm_initial_balance
      account_info
    end

    def confirm_initial_balance
      if @balance < 0 #Can improve on this later
        raise ArgumentError.new("Balance must be integer value 0 or greater.")
      end
    end

    def account_info
      puts "\n     Account ID: #{@id}"
      puts "Initial Balance: #{@balance}"
    end

    def withdraw(withdrawal_amount)
      # print "\nEnter value to be withdrawn: "
      # withdrawal_amount = gets.chomp.to_i
      if withdrawal_amount > @balance
        puts "\nWithdrawal denied."
        puts "\nBalance: #{@balance}.\n"
        return @balance
      else
        @balance = @balance - withdrawal_amount
        puts "\nBalance after withdrawal: #{@balance}\n"
        return @balance
      end
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
