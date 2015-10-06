module Bank

  class Owner
    attr_reader :first_name, :last_name, :address

    def initialize(first_name, last_name, address)

      @first_name = first_name
      @last_name = last_name
      @address = address
    end

  end

  class Account
    attr_reader :balance, :id, :owner

    def initialize(id, initial_balance)
      #   another way of generating an error if user starts with negative balance
      # while initial_balance < 0
      #   puts "You cannot open an account in debt."
      #   puts "Please enter a new opening balance: "
      #   initial_balance = gets.chomp.to_i
      # end

      if initial_balance < 0
        raise StandardError, "You cannot open an account in debt."
      end

      @balance = initial_balance
      @id = id
    end

    def withdraw(withdraw_amt)
      while (@balance - withdraw_amt) < 0
        puts "You cannot overdraft your account. Your current balance is $#{@balance}"
        puts "Please enter a new withdrawl amount: "
        withdraw_amt = gets.chomp.to_i
      end

      @balance -= withdraw_amt
      puts "Your previous account balance was $#{@balance + withdraw_amt}."
      puts "It is now $#{@balance}."
    end

    def deposit(deposit_amt)
      @balance += deposit_amt
      puts "Your previous account balance was $#{@balance - deposit_amt}."
      puts "It is now $#{@balance}."
    end

    def show_balance
      puts "Your current balance is $#{@balance}"
    end

    def assign_owner(first_name, last_name, address)
      @owner = Bank::Owner.new(first_name, last_name, address)
    end
  end
end
