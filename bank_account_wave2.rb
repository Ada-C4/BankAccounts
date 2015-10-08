require 'money'

module Bank
	require 'csv'

	class Account

		attr_accessor :balance, :account_id

		def initialize(account_id, balance, date_opened)
			@account_id = account_id

			if balance < 0 
				raise ArgumentError.new("Cannot have a negative initial balance.")
			end

			@balance = balance
			@date_opened = DateTime.strptime(date_opened, "%Y-%m-%d %H:%M:%S %z")
		end

		def withdraw(withdraw_amount)
			withdraw_amount = withdraw_amount.to_i
			while withdraw_amount > @balance
				# raise ArgumentError.new("Cannot take more money out than you have.")
				puts "Not enough money in this account."
				puts "The current balance is #{@balance}. Please put in a different amount."
				withdraw_amount = gets.chomp.to_i
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

			# match_account = Account.new(match_id[0].to_i, match_id[1].to_i, match_id[2])
			# puts match_account
		end
	end

	class Owner

		attr_accessor :identifier, :first_name, :last_name, :street, :city, :state
	

		def initialize(owner_hash)
			@identifier = owner_hash[:identifier]
			@last_name = owner_hash[:last_name]
			@first_name = owner_hash[:first_name]
			@street = owner_hash[:street]
			@city = owner_hash[:city]
			@state = owner_hash[:state]
		end

		def self.all 
			owner_csv = CSV.read("./support/owners.csv")

			owners_array = []

			owner_csv.each do |row|
				owner_hash = {:identifier => row[0], :last_name => row[1], :first_name => row[2], :street => row[3], :city => row[4], :state => row[5]}
				owners_array.push(Owner.new(owner_hash))
			end
			return owners_array
		end

		def self.find(id)
			self.all.find do |line|
				line.identifier.to_i == id
			end
		end

	end
end

# LOGAN = {
# 			:first_name => "Logan",
# 			:last_name => "McDonald",
# 			:street => "1234 E. 1st",
# 			:city => "Seattle",
# 			:state => "WA",
# 			:zip => 92839
# 		}

# my_account = Bank::Account.new(12345, 1000000)