module Bank
	require 'csv'

	class Owner

		attr_accessor :identifier, :first_name, :last_name, :street, :city, :state, :account

		def initialize(owner_hash)
			@identifier = owner_hash[:identifier]
			@last_name = owner_hash[:last_name]
			@first_name = owner_hash[:first_name]
			@street = owner_hash[:street]
			@city = owner_hash[:city]
			@state = owner_hash[:state]
			@account = nil
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

		def self.master_list

			master_list = []
			account_owner_csv = CSV.read("./support/account_owners.csv")

			account_owner_csv.each do |row|
				account_list = Bank::Account.find(row[0].to_i)
				account_owner = self.find(row[1].to_i)

				account_owner.account = account_list
				master_list.push(account_owner)
			end

			return master_list
			puts master_list.find(1212)
		end

	end
end