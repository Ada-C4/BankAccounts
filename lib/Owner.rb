module Bank
  require "./account.rb"

  class Owner

     attr_accessor :id, :last_name, :first_name, :address, :city, :state

     def initialize (info_hash)
       @id = info_hash [:id]
       @last_name = info_hash [:last_name]
       @first_name = info_hash [:first_name]
       @address = info_hash [:address]
       @city = info_hash [:city]
       @state = info_hash [:state]
     end

     def self.create_owner (person_array)
       person_id = person_array[0].to_i
       person_last_name = person_array[1]
       person_first_name = person_array[2]
       person_address = person_array[3]
       person_city = person_array[4]
       person_state = person_array[5]
       owner =   {id: person_id,
                 last_name: person_last_name,
                 first_name: person_first_name,
                 address: person_address,
                 city: person_city,
                 state: person_state
                 }
       return Bank::Owner.new(owner)
     end

     def self.all
       sample = CSV.read("./support/owners.csv")
       owners = []
       sample.each do |row|
         owner = create_owner(row)
         owners.push(owner)
       end
       return owners
     end

     def self.find(id)
       sample = CSV.read("./support/owners.csv")
       sample.each do |row|
         if row[0] == id
           return create_owner(row)
         end
       end
     end


 ## Why isn't this working??

     def self.owner_account
       sample = CSV.read("./support/account_owners.csv")
       owner_accounts_array =[]
       sample.each do |row|
         account = Bank::Account.find(row[0].to_i)
         owner = Bank::Owner.find(row[1].to_i)
         if account == nil
           break
         else
         account.set_owner(owner)
         owner_accounts_array.push(account)
         end
          return owner_accounts_array
       end
     end

  end
end
