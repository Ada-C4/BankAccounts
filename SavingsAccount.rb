

module Bank

class SavingsAccount < Account

def initialize(account_id, initial_balance, open_date, min_balance = 1000, fee = 200)
  super(account_id, initial_balance, open_date, min_balance, fee)
end



end

end
