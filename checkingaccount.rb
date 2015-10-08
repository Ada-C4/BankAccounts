module Bank

  class CheckingAccount < Account
    def initialize(id, balance, open_date)
      super

      @act_withdraw_fee = 100
      @overdraft_amt = -1000
    end

    def withdraw(withdraw_amt)
      super
    end

    def withdraw_using_check(amount)
      withdraw


    end


  end
end
