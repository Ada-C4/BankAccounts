module Bank
  class Account

    attr_reader :balance, :owner

    def initialize(id, initial_balance)
      #@account_owner = owner.first_name
      @id = id
      @balance = initial_balance
      @owner = nil

      # Raises an argument error if the initial balance is less than 0
      if initial_balance < 0
        raise ArgumentError, "The balance cannot be less than 0."
      end
    end

    def withdraw(amount_to_withdraw)
      if (@balance - amount_to_withdraw)< 0
        puts "The requested withdrawal is more than the available funds."
        puts "You only have $#{@balance} available for withdrawal."
        return @balance
      else
        @balance -= amount_to_withdraw
        puts "You have withdrawn $#{amount_to_withdraw}."
        puts "Your current balance is $#{@balance}"
        return @balance
      end
    end

    def deposit(amount_to_deposit)
      @balance += amount_to_deposit
      puts "You have deposited $#{amount_to_deposit}."
      puts "Your current balance is $#{@balance}."
      return @balance
    end

    def current_balance
      puts "The account with ID #{@id} currently has a balance of $#{@balance}."
    end

    def add_owner(owner)
      @owner = owner
    end


  end

  class Owner
    attr_reader :first_name, :last_name, :street, :city, :state, :zip_code

    def initialize(owner_hash)
      @first_name = owner_hash[:first_name]
      @last_name = owner_hash[:last_name]
      @street = owner_hash[:street]
      @city = owner_hash[:city]
      @state = owner_hash[:state]
      @zip_code = owner_hash[:zip_code]
    end

    def print_owner_details
      puts "The owner of this account is #{@first_name} #{@last_name}."
      puts "Street: #{@street}"
      puts "City: #{@city}"
      puts "State: #{@state}"
      puts "Zip: #{@zip_code}"
    end

  end

end
