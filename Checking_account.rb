module Bank
  require 'pry'
  require 'csv'

  class CheckingAccount < Account

    def initialize (account_id, balance, open_date, owner = nil)
      super(account_id, balance, open_date, owner = nil)
      @withdrawalfee = 1
      @withdrawalcap = @balance - 1
    end
  end
end
