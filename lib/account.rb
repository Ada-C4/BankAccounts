require 'csv'

module Bank
	class Account

		attr_accessor :balance, :account_id, :date_opened

		def initialize(account_id, balance, date_opened)
			@account_id = account_id
			@balance = balance.to_i
			check_balance
			@min_balance = nil
			@date_opened = DateTime.strptime(date_opened, "%Y-%m-%d %H:%M:%S %z")

			puts "The balance is #{@balance}."
		end

		def check_balance
			if @balance.to_i < @min_balance.to_i
				raise ArgumentError.new("Cannot have that initial balance.")
			end
		end

		def withdraw(withdraw_amount)
			withdraw_amount = withdraw_amount.to_i
			while withdraw_amount > @balance
				puts "Not enough money in this account."
				puts "The current balance is #{@balance}. Please put in a different amount."
				withdraw_amount = gets.chomp.to_i
			end

			@balance -= withdraw_amount.abs
			return balance
		end

		def deposit(deposit_amount)
			@balance += deposit_amount
			puts "Your updated balance is: #{@balance}."
		end

		def self.all 
			account_csv = CSV.read("./support/accounts.csv")
			account_instances = []

			account_csv.each do |row|
				account_instances << Account.new(row[0], row[1].to_i, row[2])
			end
			return account_instances
		end

		def self.find(id)
			self.all.find do |line|
				line.account_id.to_i == id
			end
		end

		def add_interest(rate)
			interest = @balance * rate.to_f/100
			@balance += interest

			puts "The return from interest is #{interest}."
			puts "The new balance is #{@balance}."
		end

	end
end