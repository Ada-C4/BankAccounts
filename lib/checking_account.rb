module Bank 
	class CheckingAccount < Account 
		def initialize(account_id, balance, date_opened)
			super
			@min_balance = 0
			@count_checks = 0
		end

		def withdraw(withdraw_amount)
			transaction_fee = 100
			puts "Your balance was #{@balance}."

			if withdraw_amount > @balance
				puts "Don't drop below #{@min_balance} dollars w/ transaction fee."
				puts "Your balance is still #{@balance}."
			else
				super
				@balance -= transaction_fee
				puts "Your transaction fee was #{transaction_fee}"
				puts "Your updated balance is #{@balance}." 
			end
		end

		def withdraw_using_check(amount)
			amount = amount.to_i
			transaction_fee = 100

			if @count_checks <= 2
				if @balance >= -1000
					@count_checks += 1
					@balance -= amount.abs
					@balance -= transaction_fee
					puts "Your current balance: #{@balance}."
				else
					puts "Not enough money in this account. You have to have at least 10 dollars."
					puts "The current balance is #{@balance}. Please put in a different amount."
				end
			else
				@balance -= transaction_fee
				puts "You already withdrew 3 checks this month!"
			end
		end

		def reset_checks
			@count_checks = 0 
			puts "Your checks are zero again!"
		end

		def add_interest(rate)
			return "Not a function of checking accounts."
		end
		
	end
end