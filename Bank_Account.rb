module Bank

  class Account
    attr_reader :balance

      def initialize
        print "\nEnter account number: "
        @id = gets.chomp.to_i
        print "\nEnter an initial balance: "
        @balance = gets.chomp.to_i
      end

      def withdraw
        print "\nEnter value to be withdrawn: "
        withdrawal_amount = gets.chomp.to_i
        @balance = @balance - withdrawal_amount
        puts "\nBalance after withdrawal: #{@balance}\n"
      end

      def deposit
        print "\nEnter value to be deposited: "
        deposit_amount = gets.chomp.to_i
        @balance = @balance + deposit_amount
        puts "\nBalance after deposit: #{@balance}\n"
      end

      def check_balance
        puts "\nBalance: #{@balance}\n"
      end
  end

end
