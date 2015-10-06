module Bank

  class Account
    attr_reader :balance, :id, :owner
    def initialize(balance = 0, id = 7383092, owner = nil)
      @balance = balance
      @id = 7383092
      @owner = owner
      if balance < 0
        raise ArgumentError, "Accounts cannot be opened with negative money"
      end
    end

    def withdraw(withdraw_amount)
      if @balance < withdraw_amount
        puts "Insufficient funds: withdraw denied. Your balance is #{@balance}."
      elsif @balance >= withdraw_amount
      @balance = @balance.to_i - withdraw_amount.to_i
      puts "Here is your cash monays. Your account balance is now #{@balance}"
      end
    end

    def deposit(deposit_amount)
      @balance = (@balance.to_i + deposit_amount.to_i)
      puts "Thanks for your cash monays. Your account balance is now #{@balance}"

    end

    def check_balance
      puts "You balance is #{@balance} cents"
    end

    def add_owner(owner)
      @owner = owner
    end
  end

  class Owner
    attr_reader :account, :first_name, :last_name, :address, :email, :owner_id
    def initialize(owner_hash)
      @account = account
      @first_name = owner_hash[:first_name]
      @last_name = owner_hash[:last_name]
      @address = owner_hash[:address]
      @email = owner_hash[:email]
      @owner_id = owner_hash[:id]
    end

    def who_da_owna
      puts "This account is owned by #{@first_name} #{@last_name} with #{@owner_id}"
    end
  end
end

owner_hash = {
first_name: "Winnie",
last_name: "The Pooh",
address: "Deep in the Hundred Acre Woods",
email: "poohbear@christopherrobin.com",
id: 2376423
}

a = Bank::Account.new
o = Bank::Owner.new(owner_hash)
a.add_owner(o)
puts "#{a.owner.first_name}"
a.deposit(100)
a.withdraw(50)
a.withdraw(70)
