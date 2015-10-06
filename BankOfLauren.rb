#WELCOME TO THE BANK OF LAUREN
#
# Create a `Bank` module which will contain your `Account` class and any future bank account logic.
module Bank

# Create an `Account` class which should have the following functionality:
  class Account

    @@bank_of_lauren_act_nums = []

# - Should be able to access the current `balance` of an account at any time.

  att_reader :balance

# - A new account should be created with an ID and an initial balance
    def initialize (initial_deposit)
      @account_num = generate_act_num
      @balance = initial_deposit
    end

    def generate_act_num
      rand_num = rand(100_000)
      while @@bank_of_lauren_act_nums.include?(rand_num) do
        rand_num = rand(100_000)
      end
        @@bank_of_lauren_act_nums.push(rand_num)
      return rand_num
    end

# - Should have a `withdraw` method that accepts a single parameter which represents the amount of money that will be withdrawn. This method should return the updated account balance.
    def withdraw (withdraw_amount)
      transacting = true
      withdraw_check = @balance - withdraw_amount.to_i
      while transacting do
        if withdraw_check < 0
          puts "You cannot withdaw #{withdraw_amount}. Your account currently have a blance of #{@balance}."
          print "Would you like to withdaw a differnt amount? "
          diff_amount = gets.chomp.downcase
            case diff_amount
            when "yes" || "y"
              transacting = true
            else
              transacting = false
            end
        else
          @balance = withdraw_check
          puts "You have withdrawn #{withdraw_amount}. Your blance is now #{@balance}."
          transacting = false
        end
      end
    end

# - Should have a `deposit` method that accepts a single parameter which represents the amount of money that will be deposited.
  def deposit (deposit_amount)
    transacting = true
    # deposit_check = @balance - withdraw_amount.to_i
    while transacting do
      if deposit_amount < 0
        puts "You cannot deposit a negative amount."
        print "Would you like to withdaw instead?"
        withdraw_instead = gets.chomp.downcase
          case withdraw_instead
          when "yes" || "y"
            withdraw
          end
        print "Would you like to deposit a differnt amount?"
        diff_deposit = gets.chomp.downcase
          case diff_deposit
          when "yes" || "y"
            transacting = true
          else
            transacting = false
          end
      else
        @balance = @blance + deposit_amount
        puts "You have deposited #{deposit_amount}. Your blance is now #{@balance}."
        transacting = false
      end
    end
  end

# ### Error handling
# - A new account cannot be created with initial negative balance - this will `raise` an `ArgumentError` (Google this)
# - The `withdraw` method does not allow the account to go negative - Will output a warning message and return the original un-modified balance
#
# #### Optional:
# - Create an `Owner` class which will store information about those who own the `Accounts`.
#   - This should have info like name and address and any other identifying information that an account owner would have.
# - Add an `owner` property to each Account to track information about who owns the account.
#   - The `Account` can be created with an `owner`, OR you can create a method that will add the `owner` after the `Account` has already been created.

  end
end
