module Bank
	class SavingsAccount < Account 
		def initialize(account_id, balance, date_opened)
			@min_balance = 1000
			super
		end

		def withdraw(withdraw_amount)
			transaction_fee = 200
			puts "Your balance was #{@balance}."

			if @balance - withdraw_amount <= @min_balance
				puts "Don't drop below 10 dollars w/ transaction fee."
				puts "Your balance is still #{@balance}."
			else
				super
				@balance -= transaction_fee
				puts "Your transaction fee was #{transaction_fee}"
				puts "Your updated balance is #{@balance}."  
			end
		end

		def deposit
			super
		end

		def add_interest(rate)
			interest = @balance * rate.to_f/100
			@balance += interest

			puts "The return from interest is #{interest}."
			puts "The new balance is #{@balance}."
		end

	end
end