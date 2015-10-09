module Bank 
	class MoneyMarketAccount < Account 
		attr_accessor :transaction_count

		def initialize(account_id, balance, date_opened)
			super
			@min_balance = 10_000
			@transaction_count = 0
		end

		def withdraw(withdraw_amount)	
			if (@balance - withdraw_amount) <= min_balance && @transaction_count < 6
				super
				transaction_fee = 100
				@balance -= transaction_fee
				puts "A fee of 100 dollars has been imposed because you dropped below the minimum."
				puts "Your balance is #{@balance}."
				@transaction_count += 1
			elsif @transaction_count >= 6
				puts "No more transactions are allowed this month."
			puts "Your balance is #{@balance}."
			else
				super
				puts "Your balance is #{@balance}."
				@transaction_count += 1
			end
		end

		def deposit(deposit_amount)
			if @balance >= @min_balance
				if @transaction_count < 6
					super
					@transaction_count += 1
				else
					puts "No more transactions are allowed this month."
				end
			else
				super
			end
		end

		def reset_transactions
			@transaction_count = 0
			puts "Your transactions are zero again!"
		end

	end
end