# figure out how to add to Bank module

class SavingsAccount < Account
  def initialize(id, balance, open_date)
    super
    if balance.to_i < 0
      raise StandardError, "You cannot open an account with less than $10."
    end
  end
end
