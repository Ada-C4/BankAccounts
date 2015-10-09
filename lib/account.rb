module Bank

  class Account
    @@count_accounts = 0

    attr_accessor :id, :balance, :date, :owner

    def initialize(id, date)
      @balance = initial_balance
      @id = id
      @date = date
      @@count_accounts += 1
      @owner = nil
    end

    def set_owner(owner)
      @owner = owner
    end

    #get a row from index and return a new account
    def self.create_account(person_array)
      account_id = person_array[0].to_i
      account_balance = person_array[1].to_i
      account_date = person_array[2]
      return Bank::Account.new(account_id, account_balance, account_date)
    end

    #read the CSV file and row by row use the "creat account" method to create accounts and
    #push it to an array - and return it
    def self.all
      sample = CSV.read("./support/accounts.csv")
      accounts = []
      sample.each do |row|
        account = create_account(row)
        accounts.push(account)
      end
      return accounts
    end

    def self.find(id)
      sample = CSV.read("./support/accounts.csv")
      sample.find do |row|
        if row[0].to_i == id
          return create_account(row)
        end
      end
    end




    def initial_balance(min_balance = 0)
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$".center(70)
      puts
      puts "$$$$$$$ Welcome to Tammy's Bank! $$$$$$$".center(70)
      puts "How much $$$ would you like to deposit to your new account ?".center(70)
      puts
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$".center(70)
      money = gets.chomp.to_i
      if money < 0
        raise ArgumentError.new("You can't deposit negativ amount of money")
        money = 0
      elsif  money < min_balance.to_i
        raise ArgumentError.new("You can't deposit less then $#{min_balance}")
        money = 0
      end
      return money
    end

    def show_balance
      retuen @balance
    end


    def withdraw (amount, fee = 0, min_balance = 0)
      if amount > (@balance + fee + min_balance) #since there is a minimum of $10 balance + $2 fee
        puts " Your current balance is $#{@balance/100}."
        puts "You can't go below of #{min_balance} in your account. Pay attention for $#{fee/100} fee"
        return @balance
      else
        puts "There is a $#{fee/100} fee for this withdraw. Would you like to continue?"
        answer = gets.chomp.downcase
        if answer == "y" || answer == "yes"
          puts "You had $#{@balance/100}"
          @balance = @balance - amount -  fee
          puts "Your update account balance is $#{@balance/100}"
        end
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


    def add_interest(rate)
      interest = @balance * rate
      @balance = @balance + interest
      return interest
    end



  end
end
