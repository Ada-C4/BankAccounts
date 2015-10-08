
module Bank
  require 'pry'
  require 'csv'
class SavingsAccount < Account
  # The initial balance cannot be less than $10. If it is, this will raise an ArgumentError
  def confirm_initial_balance
    if @balance < 10 #Can improve on this later
      raise ArgumentError.new("Balance must be integer value 10 or greater.")
    end
  end

end
end
