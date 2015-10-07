require "./Owner.rb"
module Bank
  class Account

    attr_accessor :balance, :id, :owner

    def initialize (owner)
      @balance = initial_balance
      @id = rand(200)
      @owner = owner
    end


    def initial_balance
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$".center(70)
      puts "$$$$$$$ Welcome to Tammy's Bank! $$$$$$$".center(70)
      puts "How much $$$ would you like to deposit to your new account ?".center(70)
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$".center(70)
      money = gets.chomp.to_i
      if money < 0
        raise ArgumentError.new("You can't deposit negativ amount of money")
        money = 0
      elsif money == 0
        puts "You have 30 days to deposit at least $5"
      end
      return money
    end

    def withdraw (amount)
      if amount > @balance
        puts "The maximun amount you can draw is #{@balance} pennies"
      else
        puts "You had $#{@balance/100}"
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

  class Owner

    attr_accessor :name, :address, :job, :accounts, :id

    def initialize (info_hash)
      @name = info_hash [:name]
      @address = info_hash [:address]
      @job = info_hash [:job]
      @accounts = []
      @id = info_hash[:id]
    end

    def add_account
      account = Bank::Account.new(self)
      @accounts.push(account)
    end


  nemo_hash = {
  name: "Nemo",
  address: "Seattle",
  job: "Student",
  id: 1283
  }

  nemo = Bank::Owner.new(nemo_hash)

  end
end
