require 'csv'
  # Create a module with the name Bank that will contain the class Account
module Bank
  # Create an Account class

class Owner

    attr_accessor :name

    def initialize(name)
    @name = name
    #@balance = balance
    puts "Hello, #{@name}."
    end
end

class Account

  attr_reader :account_id, :balance, :opendate
  # set my deafualt balance to 100
  def initialize(id, balance=100, opendate)
      if balance < 0
        raise ArgumentError, "Your balance is negative!"
      end
    @id = id
    @balance = balance
    @opendate = opendate
  end

  def display_account
    # show balance of account at initial start
    # show the account id
    puts @balance
  end

  def withdraw(amount)
    # accepts single parameters that represents the amount to be withdraw
    # return updated balance
    ## balance sets up the method that will subtract the amount from the balance
    ## have the (-) subtracts from the set from below variable
    @balance -= amount
    puts @balance
    if @balance - amount < 0
      puts "You have a negative balance!"
      puts "Please deposit money into your account."
    end
  end


  def deposit(amount)
    # accept single parameter that represents the amount of money to be depostied
    @balance += amount
    # should return updated account balance
    puts @balance
  end

  def self.all
    # open a file and puts it in the variable back_csv
    # read tells it to format the text.
    # puts the whole thing in an array, puts the lines in little arrays.
    bank_csv = CSV.read("./support/accounts.csv")
    # displaying the content
    print bank_csv
    # This will make sure the content of the file is spit out.
    # need to put all the info into the accounts and then return the accounts.
    # This gives you access to each little array
    bank_csv.map do |acct_info|
      puts acct_info
      Account.new(acct_info.first, acct_info[1].to_i, acct_info[2])
    end
  end

  def self.find(id)
    accounts = self.all
    accounts.each do |account|
      if account.id == id
        return account
      end
    end
  end

end
end


# new_user = Bank::Owner.new("Andre")
# new_account = Bank::Account.new(1234, 2000)
# new_account.display_account
# new_account.withdraw(60)
# new_account.deposit(150)
