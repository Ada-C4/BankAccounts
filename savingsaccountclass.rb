require "./bankrequirefiles.rb"
module Bank
  class SavingsAccount < Account
    def initialize(balance)
      @balance = balance
      if @balance < 1000
        raise ArgumentError.new("An initial deposit of at least ten dollars (1000 cents) is required to open an account.")
      end
    end

    # def add_interest(rate)
    # end
  end
end
