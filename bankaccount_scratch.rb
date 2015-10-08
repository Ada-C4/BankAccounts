require 'csv'

module Bank
  class Account
    attr_reader :account_id, :balance, :time
    #allows account to be created with an initial balance as a parameter
    def initialize(account_id, balance, time)
      #creates ID#
      @account_id = account_id
      @balance = balance
      @time = time
      #prevents initial balance from being a negative amount
      if balance < 0
        raise ArgumentError, "No negative balance allowed! Live within your means!"
      end
    end

    def self.all
      csv_accounts = CSV.read("./support/accounts.csv")

      account_list = []

      csv_accounts.each do |row|
        csv_detail = Bank::Account.new(row[0].to_i, row[1].to_i, row[2])
        account_list.push(csv_detail)
      end
      return account_list
    end

    def self.find(id)
      csv_accounts = CSV.read("./support/accounts.csv")
      id_match = csv_accounts.find{ |row| row[0] == id}
      return Bank::Account.new(id_match[0], id_match[1], id_match[2])
    end  

  #method to create an ID number, not unique number yet
    def generate_id
      user_id = rand(0..101)
      return user_id
    end

    #method for withdrawal
    def withdrawal(subtract_money)
      if (@balance - subtract_money) >= 0
        @balance = (@balance - subtract_money)
        #returns updated account balance
        return @balance
      else
      #rejects negative balance, and returns current balance
        puts "Your withdrawal was rejected. You only have #{@balance} dollars."
        puts "You are not allowed to overdraft. Try a smaller withdrawal."
      end
    end

  #method for deposit
    def deposit(add_money)
      @balance = (@balance + add_money)
      #returns updated account balance
      return @balance
    end
  end
end
