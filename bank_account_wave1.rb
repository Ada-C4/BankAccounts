module Bank

	attr_accessor :balance

	class Account
		def initialize(account_id = 12345, balance, owner = nil)
			@account_id = account_id
			@owner = owner

			if balance < 0 
				raise ArgumentError.new("Cannot have a negative initial balance.")
			end

			@balance = balance
		end

		def withdraw(withdraw_amount)
			if withdraw_amount.abs > @balance
				raise ArgumentError.new("Cannot take more money out than you have.")
			end

			@balance -= withdraw_amount.abs

			puts "Your updated balance is: #{@balance}."

			# Accepts a single parameter which represents the 
			# amount of money that will be withdraw. 
			# Return updated account balance. 
		end

		def deposit(deposit_amount)
			@balance += @balance
			puts "Your updated balance is: #{@balance}."
			# Accepts a single parameter which represents the 
			# amount of money that will be deposit.
			# Return the updated account balance.  
		end

	end

	class Owner

		attr_accessor :first_name, :last_name, :street, :city, :state, :zip
		
		def initialize(owner_hash)
			@first_name = owner_hash[:first_name]
			@last_name = owner_hash[:last_name]
			@street = owner_hash[:street]
			@city = owner_hash[:city]
			@state = owner_hash[:state]
			@zip = owner_hash[:zip]
		end

		def present_name
			puts "Owner #{@first_name} #{@last_name} lives on #{street} in #{@city}, #{@state} #{@zip}."
		end

	end
end

# my_account = Bank::Account.new(12345, 1000000)