module Bank
   require "./account.rb"
  class SavingsAccount < Account


    def initialize(id, date)
      super
    end

    def initial_balance
      super(1000)
    end


    def withdraw(amount)
      super(amount, 200, 1000) #in cents
    end


    def add_interest(rate)
      super(rate)
    end

  end
end
